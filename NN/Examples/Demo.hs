{-# LANGUAGE OverloadedStrings #-}
module NN.Examples.Demo(NN.Examples.Demo.main) where

import           Gen.Caffe.LayerParameter as LP
import           Gen.Caffe.NetParameter   as NP

import           Control.Lens
import           GHC.IO.Handle
import           System.IO.Temp
import           System.Process
import           Text.Printf

import           NN
import           NN.Backend.Caffe         as Caffe
import           NN.Backend.Torch         as Torch
import           NN.Examples.AlexNet
import           NN.Examples.GoogLeNet

caffe :: IO ()
caffe = do
  let output = parse googLeNet & Caffe.middleEnd & Caffe.backend
  let names = output ^. NP._layer ^..traverse . LP._name ^..traverse . _Just
  print names

torch :: IO ()
torch = do
  let Just output = parse alexNetSmall & Torch.backend
  putStr $ output ++ "\n"

visualizeGoogLeNet :: IO ()
visualizeGoogLeNet = do
  (file, handle) <- openTempFile "/tmp" "graph.pdf"
  hClose handle
  f <- parse googLeNet & visualize & pdf file
  _ <- system $ printf "open %s &" f
  return ()

visualizeGoogLeNetScaled :: IO ()
visualizeGoogLeNetScaled = do
  (file, handle) <- openTempFile "/tmp" "graphScaled.pdf"
  hClose handle
  f <- parse googLeNet & visualizeWith (scaled downscaleReLU) & pdf file
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
  visualizeGoogLeNet
  visualizeGoogLeNetScaled
