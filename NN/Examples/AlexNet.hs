module NN.Examples.AlexNet(alexNet, alexNetSmall) where

import           Control.Lens
import           Control.Monad

import           NN.DSL
import           NN.Examples.ImageNet
import           NN.Graph

alexTrain = train & cropSize' 227 & batchSize' 256 & mirror' True
alexTest = test & cropSize' 227 & batchSize' 50 & mirror' False

alexLrn = lrn & localSize' 5 & alphaLRN' 0.0001 & betaLRN' 0.75
alexConv = conv & param' alexMult & weightFillerC' (gaussian 0.01) & biasFillerC' zero
alexIP n = ip n & param' alexMult & weightFillerIP' (gaussian 0.005) & biasFillerIP' (constant 0.1)
alexPool = maxPool & poolSize' 3

alexMult = [def & lrMult' 1 & decayMult' 1, -- weights
            def & lrMult' 2 & decayMult' 0] -- biases

-- |Model
conv1 = alexConv & numOutput' 96 & kernelSize' 11 & stride' 4
pool1 = alexPool & poolStride' 3
conv2 = alexConv & numOutput' 256 & pad' 2 & kernelSize' 5 & group' 2
pool2 = alexPool & poolStride' 2
conv3 = alexConv & numOutput' 384 & pad' 1 & kernelSize' 3
conv4 = alexConv & numOutput' 384 & pad' 1 & kernelSize' 3 & group' 2 & biasFillerC' (constant 0.1)
conv5 = alexConv & numOutput' 256 & pad' 1 & kernelSize' 3 & group' 2 & biasFillerC' (constant 0.1)
pool5 = alexPool & poolStride' 2
ip6 = alexIP 4096
drop6 = dropout 0.5
ip7 = alexIP 4096
drop7 = dropout 0.5
ip8 = alexIP 1000 & weightFillerIP' (gaussian 0.01) & biasFillerIP' zero

alexNetSmall = do
  (input', representation) <- sequential [conv1, relu, pool1]
  forM_ [alexTrain, alexTest] $ attach (To input')
  forM_ [accuracy 1, accuracy 5, softmax] $ attach (From representation)

alexNet = do
  -- Set up the model
  (input', representation) <-
      sequential [
           conv1, relu, alexLrn, pool1,
           conv2, relu, alexLrn, pool2,
           conv3, relu,
           conv4, relu,
           conv5, relu, pool5,
           ip6, relu, drop6,
           ip7, relu, drop7,
           ip8]

  forM_ [alexTrain, alexTest] $ attach (To input')
  forM_ [accuracy 1, accuracy 5, softmax] $ attach (From representation)
