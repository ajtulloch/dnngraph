module NN.Passes(module NN.Passes) where

import           NN.DSL
import           NN.Graph

import           Gen.Caffe.LayerParameter   as LP

import           Control.Lens
import           Control.Monad.State.Strict
import           Data.Char
import qualified Data.Foldable              as F
import           Data.Graph.Inductive.Graph hiding ((&))
import qualified Data.Graph.Inductive.Graph as G
import           Data.Maybe
import qualified Data.Sequence              as S

import           Text.Printf
import           Text.ProtocolBuffers       as P

type Pass = (Net, Node, LayerParameter) -> LayerParameter

layerName :: LayerParameter -> Int -> Utf8
layerName l i = printf "%s_%d" (type' l & fromJust & toString & map toLower) i & s

runPass :: Net -> Pass -> Net
runPass gr pass = gmap run gr
    where
      run (_pre, i, lp, _suc) = (_pre, i, pass (gr, i, lp), _suc)

addLabels :: Pass
addLabels (_, _, lp) = update (layerTy lp)
    where
      update Data = lp & LP._top <>~ S.singleton (s "label")
      update SoftmaxWithLoss = lp & LP._bottom <>~ S.singleton (s "label")
      update Accuracy = lp & LP._bottom <>~ S.singleton (s "label")
      update _ = lp

-- |If our layerTy is the given layer that is performed in-place, then
-- update `top` to point to `bottom`.
-- If any of our parents are performed in-place, update `bottom` to
-- point to our parents `top`
optimizeInPlaceLayer :: LayerTy -> [Pass]
optimizeInPlaceLayer layerTy' = [updateIfInPlace, updateIfParentInPlace] where
    inPlace lp = layerTy lp == layerTy'
    inPlaceParents gr i = filter inPlace . map fst $ pres gr i

    updateIfInPlace (_, i, lp) =
        case (layerTy lp == layerTy', F.toList (top lp)) of
          (True, [_]) -> lp & LP._top .~ bottom lp
          (True, _) -> error $ printf "Can only have one output for an in-place layer" ++ show (layerName lp i)
          (False, _) -> lp

    updateIfParentInPlace :: Pass
    updateIfParentInPlace (gr, i, lp) =
        case updateFromParents (gr, i, lp) of
          Left e -> error e
          Right lp' -> lp'

    updateFromParents :: (Net, Node, LayerParameter) -> Either String LayerParameter
    updateFromParents (gr, i, lp) =
       case (inPlaceParents gr i, F.toList (bottom lp)) of
         ([], _) -> Right lp
         (parents, bottoms) ->
             -- TODO this is super dodgy and incorrect in the general
             -- case (there are some weird invariants we rely on), but it works for now.
             if length parents /= length bottoms
             then Left $ printf "Must have all parents in-place for in-place optimizations" ++ show (layerName lp i)
             else let parentTops = F.concatMap (F.toList . LP.top) parents in
                  if length parentTops == length ((F.toList . LP.bottom) lp)
                  then Right $ lp & LP._bottom .~ S.fromList parentTops
                  else Left $ error "asdf"

labelled gr = map (\ j -> (lab' (context gr j), j))
pres gr j = labelled gr (G.pre gr j)

addConnection :: Pass
addConnection (gr, i, lp) = lp
                            & LP._name ?~ layerName lp i
                            & LP._bottom .~ S.fromList (map (uncurry layerName) (pres gr i))
                            & LP._top <>~ S.singleton (layerName lp i)

optimizeWith :: [Pass] -> Net -> Net
optimizeWith passes gr = foldl runPass gr passes

parse :: G a b -> Gr a ()
parse g = snd (execState g (1, empty))
