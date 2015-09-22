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

ty type'' = LP.type' ?~ s (asCaffe type'')

layerTy :: LayerParameter -> LayerTy
layerTy l = fromJust (LP._type' l) & toString & toCaffe & fromJust

phase' phase'' = LP.include <>~ singleton (def & phase ?~ phase'')

param' v = param .~ fromList v

-- Data
setF outer f n = set (outer . _Just . f) (Just n)
source' source'' = setF data_param DP.source (s source'')
cropSize' = setF transform_param TP.crop_size
meanFile' meanFile'' = setF transform_param TP.mean_file (s meanFile'')
mirror' = setF transform_param TP.mirror
batchSize' = setF data_param DP.batch_size
backend' =  setF data_param DP.backend

-- Convolution
setConv = setF convolution_param
numOutputC' = setConv CP.num_output
numInputC' = setConv CP.num_input
kernelSizeC' = setConv CP.kernel_size
padC' = setConv CP.pad
groupC' = setConv CP.group
strideC' = setConv CP.stride
biasFillerC' = setConv CP.bias_filler
weightFillerC' = setConv CP.weight_filler

-- Pooling
setPool = setF pooling_param
pool' = setPool PP.pool
sizeP' = setPool PP.kernel_size
strideP' = setPool PP.stride
padP' = setPool PP.pad

-- Inner Product
setIP = setF inner_product_param
weightFillerIP' = setIP IP.weight_filler
numInputIP' = setIP IP.num_input
numOutputIP' = setIP IP.num_output
biasFillerIP' = setIP IP.bias_filler

-- LRN
setLRN = setF lrn_param
localSize' = setLRN LRN.local_size
alphaLRN' = setLRN LRN.alpha
betaLRN' = setLRN LRN.beta

-- Fillers
constant value' = def & FP.type' ?~ s "constant" & value ?~ value'
gaussian std' = def & FP.type' ?~ s "gaussian" & std ?~ std'
xavier std' = def & FP.type' ?~ s "xavier" & std ?~ std'
zero = constant 0.0

-- Multipler
lrMult' value' = lr_mult ?~ value'
decayMult' value' = decay_mult ?~ value'

-- Simple Layers
accuracy k' = def & ty Accuracy & phase' TEST & accuracy_param ?~ (def & AP.top_k ?~ k')
softmax = def & ty SoftmaxWithLoss
dropout ratio = def & ty Dropout & dropout_param ?~ (def & dropout_ratio ?~ ratio)
relu = def & ty ReLU
conv = def & ty Conv & convolution_param ?~ def
ip n = def & ty IP & inner_product_param ?~ def & numOutputIP' n
data' = def & ty Data & transform_param ?~ def & data_param ?~ def
maxPool = def & ty Pool & pooling_param ?~ def & pool' MAX
avgPool = def & ty Pool & pooling_param ?~ def & pool' AVE
lrn = def & ty LRN & lrn_param ?~ def
concat' = def & ty Concat
