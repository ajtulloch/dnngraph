{-# LANGUAGE OverloadedStrings #-}
module NN.Examples.Demo where

import           Gen.Caffe.LayerParameter as LP
import           Gen.Caffe.NetParameter   as NP

import           Control.Lens
import           GHC.IO.Handle
import           System.IO.Temp
import           System.Process
import           Text.Printf

import           NN.Backend.Caffe         as Caffe
import           NN.Backend.Torch         as Torch
import           NN.Examples.AlexNet
import           NN.Examples.GoogLeNet
import           NN.Passes
import           NN.Visualize

caffe = do
  let output = parse alexNetSmall & Caffe.middleEnd & Caffe.backend
  let names = output ^. NP._layer ^. to (fmap LP.name)
  print names

torch = do
  let Just output = parse alexNetSmall & Torch.backend
  putStr $ output ++ "\n"

vis = do
  (file, handle) <- openTempFile "/tmp" "graph.png"
  hClose handle
  f <- parse googLeNet & visualize & pdf file
  system $ printf "open %s &" f
