{-# LANGUAGE OverloadedStrings #-}
module NN.Visualize where

import           Data.GraphViz
import           Data.GraphViz.Attributes.Colors.Brewer
import           Data.GraphViz.Attributes.Complete
import qualified Data.Text.Lazy                         as L

import           Data.Graph.Inductive.Graph
import           NN.DSL

type NetVizParams = GraphvizParams Node LayerParameter () () LayerParameter

defaultNNParams =
    nonClusteredParams {
  -- Let's visualize neural networks from the bottom up
  globalAttributes = [GraphAttrs [RankDir FromBottom]],
  fmtNode = fmtLabelParameter
}


scaled :: (LayerParameter -> Double) -> NetVizParams
scaled f = defaultNNParams { fmtNode = setSize }
    where
      setSize n@(_, lp) = fmtNode defaultNNParams n ++ [Width width', Height height']
          where
            width' = 0.75 * scale
            height' = 0.5 * scale
            scale = f lp

visualizeWith :: NetVizParams -> Net -> DotGraph Node
visualizeWith = graphToDot

visualize :: Net -> DotGraph Node
visualize = visualizeWith defaultNNParams

png :: FilePath -> DotGraph Node -> IO FilePath
png path g = runGraphviz g Png path

pdf :: FilePath -> DotGraph Node -> IO FilePath
pdf path g = runGraphviz g Pdf path

fmtLabelParameter :: (Node, LayerParameter) -> [Attribute]
fmtLabelParameter (_, lp) =
    [FontName "Source Code Pro",
     textLabel label,
     style filled,
     fillColor color']
    where
      maxColors = 8
      idx = ((+1) . (`mod` maxColors) . fromEnum . layerTy) lp
      scheme = BScheme Pastel2 (fromIntegral maxColors)
      color' = BC scheme (fromIntegral idx)
      label = (L.pack . asCaffe . layerTy) lp
