{-# LANGUAGE OverloadedStrings #-}
module NN.Examples.Demo where

import           Control.Lens
import           Gen.Caffe.LayerParameter as LP
import           Gen.Caffe.NetParameter   as NP
import           GHC.IO.Handle
import           System.IO.Temp
import           System.Process
import           Text.Printf

import           NN
import           NN.Backend.Caffe         as Caffe
import           NN.Backend.Torch         as Torch
import           NN.Backend.Torch.Flat
import           NN.Backend.Torch.Torch   as Torch
import           NN.Examples.AlexNet
import           NN.Examples.GoogLeNet
import           NN.Graph                 as Graph

caffe :: IO ()
caffe = do
  let output = parse googLeNet & Caffe.middleEnd & Caffe.backend
  let names = output ^. NP._layer ^..traverse . LP._name ^..traverse . _Just
  print names

torch :: IO ()
torch = do
  print $ parse alexNetSmall & clean & expand'
  print $ parse alexNetSmall & clean & flattenStructure
  let Just s' = parse alexNet & Torch.backend
  putStr s'
  return ()

torchFancy :: IO ()
torchFancy = do
  let gr = do
        x <- layer' relu
        (_, y) <- with x >- sequential [conv, relu, maxPool, conv, relu, maxPool]
        (_, z) <- with x >- Graph.layer conv
        concat'' <- layer' concat'

        y >-> concat''
        z >-> concat''
        _ <- with concat'' >- Graph.layer softmax
        return ()
  print $ parse gr & clean & expand'
  print $ parse gr & clean & flattenStructure
  visualize' gr
  let Just str = parse gr & Torch.backend
  putStr str
  return ()

visualize' :: NetBuilder -> IO ()
visualize' g = do
  (file, handle) <- openTempFile "/tmp" "graph.pdf"
  hClose handle
  f <- parse g & visualize & pdf file
  _ <- system $ printf "open %s &" f
  return ()

visualizeGoogLeNetScaled :: IO ()
visualizeGoogLeNetScaled = do
  (file, handle) <- openTempFile "/tmp" "graphScaled.pdf"
  hClose handle
  f <- parse alexNetSmall & visualizeWith (scaled downscaleReLU) & pdf file
  _ <- system $ printf "open %s &" f
  return ()
      where
        downscaleReLU lp = go (layerTy lp)
            where
              go ReLU = 1
              go _ = 2

main :: IO ()
main = do
  torch
  caffe
  visualizeGoogLeNetScaled
