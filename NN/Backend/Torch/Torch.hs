{-# LANGUAGE DeriveFunctor #-}
module NN.Backend.Torch.Torch where

import           Data.Word
import           Gen.Caffe.ConvolutionParameter        as CP
import           Gen.Caffe.DropoutParameter            as DP
import           Gen.Caffe.InnerProductParameter       as IP
import           Gen.Caffe.LayerParameter              as LP
import           Gen.Caffe.PoolingParameter            as PP
import           Gen.Caffe.PoolingParameter.PoolMethod as PP

import           Control.Applicative
import           Control.Lens
import           Data.Graph.Inductive.Graph            hiding ((&))
import           Data.Graph.Inductive.Query
import           Language.Lua.Syntax

import           NN.Backend.Torch.Lua
import           NN.DSL

-- Modules are either sequential or criterion - which are treated
-- differently by Torch
data Module a = Criterion a | Inner a deriving (Functor, Show)
data TorchModule = TorchModule Name Name [Exp] deriving (Show)

torchExp :: TorchModule -> Exp
torchExp module' = PrefixExp (PEFunCall (construct module'))
    where
      construct (TorchModule luaModule torchModule args) =
          NormalFunCall (PEVar (SelectName (var luaModule) torchModule)) (Args args)

convolutionImpl :: Maybe Word32 -> String
convolutionImpl Nothing = "SpatialConvolutionMM"
convolutionImpl (Just kW) = if kW > 5 then "SpatialConvolutionFFT" else "SpatialConvolutionMM"

torchModules :: LayerParameter -> [Module TorchModule]
torchModules lp = go (layerTy lp)
    where
      nn name' args = Inner $ TorchModule "nn" name' (toLua <$> args)
      criterion name' = Criterion $ TorchModule "nn" name' []
      nn' name' = nn name' ([] :: [Float])

      -- Ugly case anaysis, sorry.
      go Pool = [nn ty' [kW, kH, dW, dH]]
          where
            kW = poolP PP._kernel_size
            kH = kW
            dW = poolP PP._stride
            dH = dW
            ty' = case poolP PP._pool of
                   Just MAX -> "SpatialMaxPooling"
                   Just AVE -> "SpatialAveragePooling"
                   _ -> error "Unsupported Pooling Type"
            poolP f = lp ^. LP._pooling_param ^? _Just . f . _Just
      go Conv = [nn (convolutionImpl kW) [nInputPlane, nOutputPlane, kW, kH, dW, dH, padding]]
          where
            kW = convP CP._kernel_size
            kH = kW
            dW = convP CP._stride
            dH = dW
            padding = convP CP._pad
            -- TODO - propagation pass to size the layers
            nInputPlane = Nothing
            nOutputPlane = convP CP._num_output
            convP f = lp ^. LP._convolution_param ^? _Just . f . _Just
      go ReLU = [nn' "Threshold"]
      go IP = [nn "Linear" [nInput, nOutput]]
          where
            -- TODO - propagation pass to size the layers
            nInput = Nothing
            nOutput = lp ^. LP._inner_product_param ^? _Just  . IP._num_output . _Just
      go Dropout = [nn "Dropout" [ratio]] where Just ratio = lp ^. LP._dropout_param ^? _Just . DP._dropout_ratio . _Just
      go SoftmaxWithLoss = [nn' "LogSoftMax", criterion "ClassNLLCriterion"]
      go ty' = error  $ "Unhandled layer type: " ++ show ty'

torchLayers :: [LayerTy]
torchLayers = [Pool, Conv, ReLU, IP, Dropout, SoftmaxWithLoss]

-- Graph validation
-- A graph is `sequential` if and only if
-- - It has n-1 edges
-- - It is connected
-- - Every node has an out degree of zero or one.
isSequential :: Net -> Bool
isSequential gr = e == (n-1) && length (dff' gr) == 1 && and [l `elem` [0, 1] | i <- nodes gr, let l = (length . suc gr) i]
    where
      e = length (edges gr)
      n = length (nodes gr)

clean :: Net -> Net
clean gr = foldl (flip delNode) gr toDelete
    where
      toDelete = filter (\n -> layerTy (label n) `notElem` torchLayers) (nodes gr)
      label n = lab' (context gr n)

linearize :: Net -> Maybe [LayerParameter]
linearize gr = if isSequential gr then Just (topsort' gr) else Nothing
