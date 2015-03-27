{-# LANGUAGE OverloadedStrings #-}
module NN.Backend.Purine.Visualize(visualizePurine) where

import           Data.Graph.Inductive.Graph             hiding ((&))
import           Data.GraphViz                          hiding (parse)
import           Data.GraphViz.Attributes.Colors.Brewer
import           Data.GraphViz.Attributes.Complete
import           Formatting
import           NN.Backend.Purine.Purine
import           NN.DSL
import           NN.Graph

type PurineParams = GraphvizParams Node Purine () () Purine

purineParams :: PurineParams
purineParams = nonClusteredParams {
  -- Let's visualize neural networks from the bottom up
  globalAttributes = [GraphAttrs [RankDir FromBottom]],
  fmtNode = fmtPurineLabel . snd
}

fmtPurineLabel :: Purine -> [Attribute]
fmtPurineLabel = go . ex
    where
      go (label, colorId) = [FontName "Source Code Pro", textLabel label, style filled, fillColor color']
          where
            scheme = BScheme Pastel2 8
            color' = BC scheme colorId
      ex (B b Tensor) = (format ("Blob::" % shown) b, 1)
      ex (Op Copy) = ("Copy", 2)
      ex (Op Optim) = ("Optim", 2)
      ex (Op (Computation lp op')) = (l, c op')
          where
            c UpdateGradInput = 4
            c UpdateOutput = 5
            c AccGradParameters = 6
            l = format (string % "::" % shown) ((asCaffe . layerTy) lp) op'

visualizePurine :: Gr Purine () -> DotGraph Node
visualizePurine = graphToDot purineParams
