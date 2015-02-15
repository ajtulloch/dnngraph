module NN.Examples.ImageNet(test, train) where

import           Gen.Caffe.DataParameter.DB as DP

import           Control.Lens

import           NN.DSL

-- |Base layer specifications
imagenetData = data'
               & meanFile' "data/ilsvrc12/imagenet_mean.binaryproto"
               & backend' LMDB

-- |Data
test = imagenetData & phase' TEST & source' "examples/imagenet/ilsvrc12_train_lmdb"
train = imagenetData & phase' TRAIN & source' "examples/imagenet/ilsvrc12_train_lmdb"
