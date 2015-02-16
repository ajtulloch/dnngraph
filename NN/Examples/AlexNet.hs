module NN.Examples.AlexNet where

import           Control.Lens
import           Control.Monad

import           NN
import           NN.Examples.ImageNet

alexTrain = train & cropSize' 227 & batchSize' 256 & mirror' True
alexTest = test & cropSize' 227 & batchSize' 50 & mirror' False

alexLrn = lrn & localSize' 5 & alphaLRN' 0.0001 & betaLRN' 0.75
alexConv = conv & param' alexMult & weightFillerC' (gaussian 0.01) & biasFillerC' zero
alexIP n = ip n & param' alexMult & weightFillerIP' (gaussian 0.005) & biasFillerIP' (constant 0.1)
alexPool = maxPool & sizeP' 3

alexMult = [def & lrMult' 1 & decayMult' 1, -- weights
            def & lrMult' 2 & decayMult' 0] -- biases

-- |Model
conv1 = alexConv & numOutputC' 96 & kernelSizeC' 11 & strideC' 4
conv2 = alexConv & numOutputC' 256 & padC' 2 & kernelSizeC' 5 & groupC' 2
conv3 = alexConv & numOutputC' 384 & padC' 1 & kernelSizeC' 3
conv4 = alexConv & numOutputC' 384 & padC' 1 & kernelSizeC' 3 & groupC' 2 & biasFillerC' (constant 0.1)
conv5 = alexConv & numOutputC' 256 & padC' 1 & kernelSizeC' 3 & groupC' 2 & biasFillerC' (constant 0.1)

alexNetSmall = do
  (input', representation) <- sequential [conv1, relu, alexPool & strideP' 3]
  forM_ [alexTrain, alexTest] $ attach (To input')
  forM_ [accuracy 1, accuracy 5, softmax] $ attach (From representation)

alexNet = do
  -- Set up the model
  (input', representation) <-
      sequential [
           -- Convolutional Layers
           conv1, relu, alexLrn, alexPool & strideP' 3,
           conv2, relu, alexLrn, alexPool & strideP' 2,
           conv3, relu,
           conv4, relu,
           conv5, relu, alexPool & strideP' 2,
           -- FC Layers
           alexIP 4096, relu, dropout 0.5,
           alexIP 4096, relu, dropout 0.5,
           alexIP 1000 & weightFillerIP' (gaussian 0.01) & biasFillerIP' zero]

  forM_ [alexTrain, alexTest] $ attach (To input')
  forM_ [accuracy 1, accuracy 5, softmax] $ attach (From representation)

main = cli alexNet
