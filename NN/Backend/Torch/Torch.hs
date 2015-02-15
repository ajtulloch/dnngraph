{-# LANGUAGE DeriveFunctor #-}
module NN.Backend.Torch.Torch where

import           Gen.Caffe.ConvolutionParameter        as CP
import           Gen.Caffe.DropoutParameter            as DP
import           Gen.Caffe.InnerProductParameter       as IP
import           Gen.Caffe.LayerParameter              as LP
import           Gen.Caffe.PoolingParameter            as PP
import           Gen.Caffe.PoolingParameter.PoolMethod as PP

import           Control.Lens
import           Data.Graph.Inductive.Graph            hiding ((&))
import           Data.Graph.Inductive.Query
import           Data.Maybe
import           Language.Lua.Syntax

import           NN.Backend.Torch.Lua
import           NN.DSL

-- Modules are either sequential or criterion - which are treated
-- differently by Torch
data Module a = Criterion a | Inner a deriving (Functor)
data TorchModule = TorchModule Name Name [Exp]

torchExp :: TorchModule -> Exp
torchExp module' = PrefixExp (PEFunCall (constructModule module'))
    where
      constructModule (TorchModule luaModule torchModule args) =
          NormalFunCall (PEVar (SelectName (var luaModule) torchModule)) (Args args)

torchModules :: LayerParameter -> [Module TorchModule]
torchModules lp = go (layerTy lp)
    where
      nn name' args = Inner $ TorchModule "nn" name' (map toLua args)
      criterion name' = Criterion $ TorchModule "nn" name' []
      nn' name' = nn name' ([] :: [Float])

      -- Ugly case anaysis, sorry.
      go Pool = [nn ty' [kW, kH, dW, dH]]
          where
            kW = poolP PP._kernel_size
            kH = kW
            dW = poolP PP._stride
            dH = dW
            ty' = case fromJust (poolP PP._pool) of
                   MAX -> "SpatialMaxPooling"
                   AVE -> "SpatialAveragePooling"
                   _ -> error "Unsupported Pooling Type"
            poolP f = lp ^. LP._pooling_param ^. to fromJust ^. f
      go Conv = [nn "SpatialConvolutionMM" [nInputPlane, nOutputPlane, kW, kH, dW, dH, padding]]
          where
            kW = convP CP._kernel_size
            kH = kW
            dW = convP CP._stride
            dH = dW
            padding = convP CP._pad
            nInputPlane = Nothing
            nOutputPlane = convP CP._num_output
            convP f = lp ^. LP._convolution_param ^. to fromJust ^. f
      go ReLU = [nn' "Threshold"]
      go IP = [nn "Linear" [Nothing, Just nOutput]] where nOutput = lp ^. LP._inner_product_param ^. to fromJust ^. IP._num_output
      go Dropout = [nn "Dropout" [ratio]] where ratio = lp ^. LP._dropout_param ^. to fromJust ^. DP._dropout_ratio
      go SoftmaxWithLoss = [nn' "LogSoftMax", criterion "ClassNLLCriterion"]
      go ty' = error  $ "Unhandled layer type: " ++ show ty'


torchLayers = [Pool, Conv, ReLU, IP, Dropout, SoftmaxWithLoss]

-- Graph validation
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
