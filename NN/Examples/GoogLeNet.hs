{-# LANGUAGE RecordWildCards #-}
module NN.Examples.GoogLeNet(googLeNet) where

import           Gen.Caffe.FillerParameter       as FP
import           Gen.Caffe.InnerProductParameter as IP
import           Gen.Caffe.LayerParameter        as LP

import           Control.Lens
import           Control.Monad
import           Data.Sequence                   (singleton)
import           Data.Word


import           NN.DSL
import           NN.Graph

import           NN.Examples.ImageNet


googleTrain = train & mirror' True & batchSize' 32 & cropSize' 224
googleTest = test & mirror' False & batchSize' 50 & cropSize' 224

googleMult = [def & lrMult' 1 & decayMult' 1, -- weights
              def & lrMult' 2 & decayMult' 0] -- biases
googleConv = conv & param' googleMult & biasFillerC' (constant 0.2)
googleLRN = lrn & localSize' 5 & alphaLRN' 0.0001 & betaLRN' 0.75
googlePool = maxPool & poolSize' 3 & poolStride' 2
googleIP n = ip n & param' googleMult

conv1 = googleConv & numOutput' 64 & pad' 3 & kernelSize' 7 & stride' 2 & weightFillerC' (xavier 0.1)
conv2 = googleConv & numOutput' 192 & pad' 1 & kernelSize' 3 & weightFillerC' (xavier 0.03)

topPool = avgPool & poolSize' 7 & poolStride' 1
topFc = googleIP 1000 & biasFillerIP' (constant 0) & weightFillerIP' (xavier 0.0)
        -- Weird, but in Caffe replication
        & _inner_product_param._Just.IP._weight_filler._Just._std .~ Nothing

data Inception = Inception {_1x1, _3x3reduce, _3x3, _5x5reduce, _5x5, _poolProj :: Word32}

inception :: Node -> Inception -> G LayerParameter Node
inception input Inception{..} = do
  columns' <- mapM sequential columns
  concat'' <- layer' concat'
  forM_ columns' $ \(bottom, top) -> input >-> bottom >> top >-> concat''
  return concat''
    where
      columns = [
       [googleConv & numOutput' _1x1  & kernelSize' 1 & weightFillerC' (xavier 0.03), relu],
       [googleConv & numOutput' _3x3reduce & kernelSize' 1 & weightFillerC' (xavier 0.09), relu, googleConv & numOutput' _3x3 & kernelSize' 3 & weightFillerC' (xavier 0.03) & pad' 1, relu],
       [googleConv & numOutput' _5x5reduce & kernelSize' 1 & weightFillerC' (xavier 0.2), relu, googleConv & numOutput' _5x5 & kernelSize' 5 & weightFillerC' (xavier 0.03) & pad' 2, relu],
       [maxPool& poolSize' 3 & poolStride' 3 & poolPad' 1, relu, googleConv & numOutput' _poolProj & kernelSize' 1 & weightFillerC' (xavier 0.1), relu]]

intermediateClassifier :: Node -> NetBuilder
intermediateClassifier source = do
  (input, representation) <- sequential [pool1, conv1', relu, fc1, relu, dropout 0.7, fc2]
  source >-> input

  forM_ [accuracy 1, accuracy 5, softmax & _loss_weight <>~ singleton 0.3] $ attach (From representation)
    where
      pool1 = avgPool & poolSize' 5 & poolStride' 3
      conv1' = googleConv & numOutput' 128 & kernelSize' 1 & weightFillerC' (xavier 0.08)
      fc1 = googleIP 1024 & weightFillerIP' (xavier 0.02) & biasFillerIP' (constant 0.2)
      fc2 = googleIP 1000 & weightFillerIP' (xavier 0.0009765625) & biasFillerIP' (constant 0)

-- What to do at each step in the inner column?
data ColumnStep = I Inception | Classifier | MaxPool

googLeNet = do
  (input, initial) <- sequential [conv1, relu, googlePool, googleLRN, conv2, relu, googleLRN, googlePool]

  incepted <- foldM inceptionClassifier initial [
             I $ Inception 64 96 128 16 32 32,
             I $ Inception 128 128 192 32 96 64,
             MaxPool,
             I $ Inception 192 96 208 16 48 64,
             Classifier,
             I $ Inception 150 112 224 24 64 64,
             I $ Inception 128 128 256 24 64 64,
             I $ Inception 112 144 288 32 64 64,
             Classifier,
             I $ Inception 256 160 320 32 128 128,
             MaxPool,
             I $ Inception 256 160 320 32 128 128,
             I $ Inception 384 192 384 48 128 128]

  (_, representation) <- return (incepted, incepted) >- sequential [topPool, dropout 0.4, topFc]

  forM_ [accuracy 1, accuracy 5, softmax] $ attach (From representation)
  forM_ [googleTrain, googleTest] $ attach (To input)
    where
      inceptionClassifier input (I inceptor) = inception input inceptor
      inceptionClassifier input Classifier = intermediateClassifier input >> return input
      inceptionClassifier input MaxPool = do {node <- layer' googlePool; input >-> node; return node}
