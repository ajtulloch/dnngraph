{-# LANGUAGE RecordWildCards #-}
module NN.Backend.Purine where

import           Data.Graph.Inductive.Graph             as G hiding ((&))

import           Control.Lens
import           Data.Sequence
import           Gen.Caffe.LayerParameter
import           Gen.Caffe.PurineNetParameter
import           Gen.Caffe.PurineNetParameter.Direction as P
import           Gen.Caffe.PurineNetParameter.Edge      as P
import           Gen.Caffe.PurineNetParameter.Node      as P
import           Gen.Caffe.PurineNetParameter.Operation as P
import           NN.Backend.Purine.Purine               as Purine
import           NN.DSL
import           NN.Graph
import           NN.Passes

middleEnd :: Net -> Gr Purine ()
middleEnd = parse . graphToPurine

toEdge :: G.Edge -> P.Edge
toEdge (fromId', toId') = def
                          & _fromId ?~ (fromIntegral fromId')
                          & _toId ?~ (fromIntegral toId')

toNode :: G.Node -> Purine -> P.Node
toNode nodeId purine
    = def
      & _nodeId ?~ fromIntegral nodeId
      & _layerParameter .~ layerParameter' purine
      & _direction .~ direction' purine
      & _operation .~ operation' purine

operation' :: Purine -> Maybe P.Operation
operation' (Op Purine.Computation{..}) = Just P.Computation
operation' (Op Purine.Optim) = Just P.Optim
operation' (Op Purine.Copy) = Just P.Copy
operation' (B{..}) = Nothing

direction' :: Purine -> Maybe Direction
direction' (Op (Purine.Computation _ d)) = Just d
direction' _ = Nothing

layerParameter' :: Purine -> Maybe LayerParameter
layerParameter' (Op (Purine.Computation lp _)) = Just lp
layerParameter' _ = Nothing

backend :: Gr Purine () -> PurineNetParameter
backend gr = def & _edges <>~ edges' & _nodes <>~ nodes'
    where
      edges' = G.edges gr & map toEdge & fromList
      nodes' = G.labNodes gr & map (uncurry toNode) & fromList
