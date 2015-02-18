{-# LANGUAGE OverloadedStrings #-}
module NN.Examples.Demo where

import           Control.Lens
import           Control.Monad
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

caffe :: IO ()
caffe = do
  let output = parse googLeNet & Caffe.middleEnd & Caffe.backend
  let names = output ^. NP._layer ^.. traverse . LP._name ^.. traverse . _Just
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
  let gr' = do
        x <- layer' relu
        c <- layer' concat'

        forM_ [1..4] $ \_ -> do
               (b, t) <- sequential [conv, relu, maxPool, conv, relu]
               x >-> b
               t >-> c
        return (x, c)

  let gr = void $ gr' >- gr' >- sequential [ip 4096, relu, dropout 0.5, ip 1000]
  print $ parse gr & clean & expand'
  print $ parse gr & clean & flattenStructure
  visualize' gr
  let Just str = parse gr & Torch.backend
  putStr str
  return ()

visualize' :: NetBuilder () -> IO ()
visualize' g = do
  (file, handle) <- openTempFile "/tmp" "graph.png"
  hClose handle
  f <- parse g & visualize & png file
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
