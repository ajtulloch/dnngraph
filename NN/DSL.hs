{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module NN.DSL(module NN.DSL) where

import           Gen.Caffe.AccuracyParameter           as AP
import           Gen.Caffe.ConvolutionParameter        as CP
import           Gen.Caffe.DataParameter               as DP
import           Gen.Caffe.DropoutParameter            as DP
import           Gen.Caffe.FillerParameter             as FP
import           Gen.Caffe.InnerProductParameter       as IP
import           Gen.Caffe.LayerParameter              as LP
import           Gen.Caffe.LRNParameter                as LRN
import           Gen.Caffe.NetStateRule                as NS
import           Gen.Caffe.ParamSpec                   as PS
import           Gen.Caffe.Phase                       as P
import           Gen.Caffe.PoolingParameter            as PP
import           Gen.Caffe.PoolingParameter.PoolMethod as PP
import           Gen.Caffe.TransformationParameter     as TP

import           Control.Lens
import           Data.Maybe
import           Data.Sequence
import           NN.Graph
import           Text.ProtocolBuffers                  as P

type Net = Gr LayerParameter ()
type AnnotatedNet a = Gr (LayerParameter, a) ()
type NetBuilder a = G LayerParameter a

data LayerTy = Data
             | Pool
             | Concat
             | Conv
             | IP
             | LRN
             | ReLU
             | Dropout
             | Accuracy
             | SoftmaxWithLoss
               deriving (Show, Eq, Enum)

-- Manually implement for exhausiveness checking + Caffe
-- idiosyncracies
asCaffe :: LayerTy -> String
asCaffe Data = "Data"
asCaffe Concat = "Concat"
asCaffe Pool = "Pooling"
asCaffe Conv = "Convolution"
asCaffe IP = "InnerProduct"
asCaffe LRN = "LRN"
asCaffe ReLU = "ReLU"
asCaffe Dropout = "Dropout"
asCaffe Accuracy = "Accuracy"
asCaffe SoftmaxWithLoss = "SoftmaxWithLoss"

toCaffe :: String -> Maybe LayerTy
toCaffe "Data" = Just Data
toCaffe "Concat" = Just Concat
toCaffe "Pooling" = Just Pool
toCaffe "Convolution" = Just Conv
toCaffe "InnerProduct" = Just IP
toCaffe "LRN" = Just LRN
toCaffe "ReLU" = Just ReLU
toCaffe "Dropout" = Just Dropout
toCaffe "Accuracy" = Just Accuracy
toCaffe "SoftmaxWithLoss" = Just SoftmaxWithLoss
toCaffe _ = Nothing

s = P.fromString

def :: Default a => a
def = P.defaultValue

ty type'' = LP._type' ?~ s (asCaffe type'')

layerTy :: LayerParameter -> LayerTy
layerTy l = fromJust (LP.type' l) & toString & toCaffe & fromJust

phase' phase'' = LP._include <>~ singleton (def & _phase ?~ phase'')

param' v = _param .~ fromList v

-- Data
setF outer f n = set (outer . _Just . f) (Just n)
source' source'' = setF _data_param DP._source (s source'')
cropSize' = setF _transform_param TP._crop_size
meanFile' meanFile'' = setF _transform_param TP._mean_file (s meanFile'')
mirror' = setF _transform_param TP._mirror
batchSize' = setF _data_param DP._batch_size
backend' =  setF _data_param DP._backend

-- Convolution
setConv = setF _convolution_param
numOutputC' = setConv CP._num_output
numInputC' = setConv CP._num_input
kernelSizeC' = setConv CP._kernel_size
padC' = setConv CP._pad
groupC' = setConv CP._group
strideC' = setConv CP._stride
biasFillerC' = setConv CP._bias_filler
weightFillerC' = setConv CP._weight_filler

-- Pooling
setPool = setF _pooling_param
pool' = setPool PP._pool
sizeP' = setPool PP._kernel_size
strideP' = setPool PP._stride
padP' = setPool PP._pad

-- Inner Product
setIP = setF _inner_product_param
weightFillerIP' = setIP IP._weight_filler
numInputIP' = setIP IP._num_input
numOutputIP' = setIP IP._num_output
biasFillerIP' = setIP IP._bias_filler

-- LRN
setLRN = setF _lrn_param
localSize' = setLRN LRN._local_size
alphaLRN' = setLRN LRN._alpha
betaLRN' = setLRN LRN._beta

-- Fillers
constant value' = def & FP._type' ?~ s "constant" & _value ?~ value'
gaussian std' = def & FP._type' ?~ s "gaussian" & _std ?~ std'
xavier std' = def & FP._type' ?~ s "xavier" & _std ?~ std'
zero = constant 0.0

-- Multipler
lrMult' value' = _lr_mult ?~ value'
decayMult' value' = _decay_mult ?~ value'

-- Simple Layers
accuracy k' = def & ty Accuracy & phase' TEST & _accuracy_param ?~ (def & AP._top_k ?~ k')
softmax = def & ty SoftmaxWithLoss
dropout ratio = def & ty Dropout & _dropout_param ?~ (def & _dropout_ratio ?~ ratio)
relu = def & ty ReLU
conv = def & ty Conv & _convolution_param ?~ def
ip n = def & ty IP & _inner_product_param ?~ def & numOutputIP' n
data' = def & ty Data & _transform_param ?~ def & _data_param ?~ def
maxPool = def & ty Pool & _pooling_param ?~ def & pool' MAX
avgPool = def & ty Pool & _pooling_param ?~ def & pool' AVE
lrn = def & ty LRN & _lrn_param ?~ def
concat' = def & ty Concat
