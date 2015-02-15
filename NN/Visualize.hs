{-# LANGUAGE OverloadedStrings #-}
module NN.Visualize where

import           Data.GraphViz
import           Data.GraphViz.Attributes.Colors.Brewer
import           Data.GraphViz.Attributes.Complete
import           Data.Text.Lazy                         as L

import           NN.DSL
import           NN.Graph

visualize :: Net -> DotGraph Node
visualize = graphToDot nonClusteredParams {
              -- Let's visualize neural networks from the bottom up
              globalAttributes = [GraphAttrs [RankDir FromBottom]],
              fmtNode = fmtLabelParameter
            }

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
