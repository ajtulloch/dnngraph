{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module NN.Examples.GoogLeNet where

import           Control.Lens
import           Control.Monad

import           NN
import           NN.Examples.ImageNet

train' = train & mirror' True & batchSize' 32 & cropSize' 224
test' = test & mirror' False & batchSize' 50 & cropSize' 224

mult = [def & lrMult' 1 & decayMult' 1, -- weights
        def & lrMult' 2 & decayMult' 0] -- biases

fc n = ip n
       & param' mult
       & biasFillerIP' (constant 0)
       & weightFillerIP' (xavier 0.2)

mlp = do
  (input, representation) <- sequential [fc 100, relu, fc 100]
  forM_ [accuracy 1, accuracy 5, softmax] $ attach (From representation)
  forM_ [train', test'] $ attach (To input)

main :: IO ()
main = cli mlp
