module NN.Backend.Purine.Demo where

import           Control.Lens
import           Gen.Caffe.Phase             as P
import           NN.Backend.Purine.Purine
import           NN.Backend.Purine.Visualize
import           NN.DSL
import           NN.Examples.AlexNet
import           NN.Examples.GoogLeNet
import           NN.Graph
import           NN.Passes
import           NN.Visualize

simple :: NetBuilder ()
simple = do
  d1 <- layer' data'
  d2 <- layer' data'
  c <- layer' conv
  d1 >-> c
  d2 >-> c

  l <- layer' softmax
  c >-> l
  return ()

compileWith f = visualizePurine . f . parse . graphToPurine . parse
compile = compileWith id
compileNoCopy = compileWith elideCopies

main :: IO ()
main = do
  _ <- pdf "/tmp/gnet.pdf" . compileNoCopy $ googLeNet
  return ()

main2 :: IO ()
main2 = do
  let gr = do
          _ <- sequential [conv, relu, softmax]
          return ()
  _ <- png "/tmp/x.png" . compile $ gr
  _ <- png "/tmp/x2.png" . compileNoCopy $ gr
  return ()
