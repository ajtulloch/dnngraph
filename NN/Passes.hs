module NN.Passes(parse, optimizeWith, Pass)  where

import           Gen.Caffe.LayerParameter   as LP
import           NN.DSL
import           NN.Graph

import           Control.Monad.State.Strict
import qualified Data.Graph.Inductive.Graph as G

type Pass = (Net, Node, LayerParameter) -> LayerParameter

runPass :: Net -> Pass -> Net
runPass gr pass = G.gmap run gr
    where
      run (_pre, i, lp, _suc) = (_pre, i, pass (gr, i, lp), _suc)

optimizeWith :: [Pass] -> Net -> Net
optimizeWith passes gr = foldl runPass gr passes

parse :: G a b -> Gr a ()
parse g = snd (execState g (1, G.empty))
