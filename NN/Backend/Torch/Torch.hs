{-# LANGUAGE DeriveFunctor   #-}
{-# LANGUAGE TemplateHaskell #-}
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
import           Language.Lua.Syntax                   hiding (Concat)

import           NN.Backend.Torch.Lua
import           NN.DSL

-- Modules are either sequential or criterion - which are treated
-- differently by Torch
data Module a = Criterion a | Inner a deriving (Functor, Show)
data TorchModule = TorchModule Name Name [Exp] deriving (Show)

inners :: [Module a] -> [a]
inners xs = [a | Inner a <- xs]

criteria :: [Module a] -> [a]
criteria xs = [a | Criterion a <- xs]

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
            kW = poolP PP.kernel_size
            kH = kW
            dW = poolP PP.stride
            dH = dW
            ty' = case poolP PP.pool of
                   Just MAX -> "SpatialMaxPooling"
                   Just AVE -> "SpatialAveragePooling"
                   _ -> error "Unsupported Pooling Type"
            poolP f = lp ^?! LP.pooling_param._Just ^?! f
      go Conv = [nn (convolutionImpl kW) [nInputPlane, nOutputPlane, kW, kH, dW, dH, padding]]
          where
            kW = convP CP.kernel_size
            kH = kW
            dW = convP CP.stride
            dH = dW
            padding = convP CP.pad
            -- TODO - propagation pass to size the layers
            nInputPlane = Nothing
            nOutputPlane = convP CP.num_output
            convP f = lp ^?! LP.convolution_param._Just ^?! f
      go ReLU = [nn' "Threshold"]
      go IP = [nn "Linear" [nInput, nOutput]]
          where
            -- TODO - propagation pass to size the layers
            nInput = Nothing
            nOutput = lp ^?! LP.inner_product_param._Just ^?! IP.num_output
      go Dropout = [nn "Dropout" [ratio]] where
          Just ratio = lp ^?! LP.dropout_param._Just ^?! DP.dropout_ratio
      go SoftmaxWithLoss = [nn' "LogSoftMax", criterion "ClassNLLCriterion"]
      go Concat = [] -- Handled by flattening implementation
      go ty' = error  $ "Unhandled layer type: " ++ show ty'

torchLayers :: [LayerTy]
torchLayers = [Pool, Conv, ReLU, IP, Dropout, SoftmaxWithLoss, Concat]

clean :: Net -> Net
clean gr = foldl (flip delNode) gr toDelete
    where
      toDelete = filter (\n -> layerTy (label n) `notElem` torchLayers) (nodes gr)
      label n = lab' (context gr n)
