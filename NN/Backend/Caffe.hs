module NN.Backend.Caffe where

import           Gen.Caffe.NetParameter     as NP

import           Control.Lens
import           Data.Graph.Inductive.Query
import qualified Data.Sequence              as S

import           NN.DSL
import           NN.Passes

caffePasses :: [Pass]
caffePasses = [addConnection, addLabels] ++ optimizeInPlaceLayer ReLU ++ optimizeInPlaceLayer Dropout

middleEnd :: Net -> Net
middleEnd = optimizeWith caffePasses

backend :: Net -> NetParameter
backend gr = def & _layer <>~ S.fromList (topsort' gr)
