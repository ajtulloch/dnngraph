{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module NN.Backend.Purine.Purine where

import           Control.Applicative
import           Control.Monad
import           Data.Graph.Inductive.Graph hiding ((&))
import           Data.Maybe
import           Gen.Caffe.LayerParameter   (LayerParameter)
import           NN.DSL
import           NN.Graph

data Tensor = Tensor deriving (Show)
data Direction = UpdateOutput | UpdateGradInput | AccGradParameters deriving (Show)
data Operation = Computation LayerParameter Direction | Optim | Copy deriving (Show)
data Blob = Weights | GradWeights | Bottom | GradBottom | Top | GradTop deriving (Show)
data Purine = B Blob Tensor | Op Operation deriving (Show)
data PurineLayer = StatefulLayer {bottom, gradBottom, top, gradTop, weights, gradWeights :: Node}
                 | StatelessLayer {bottom, gradBottom, top, gradTop ::  Node}
                 | CriterionLayer {bottom, gradBottom, top :: Node }

-- Urgh, parallel heirachy
data PurineLayerTy = Stateful | Stateless | Criterion


purineTy :: LayerTy -> PurineLayerTy
purineTy ty' | ty' `elem` [Conv, IP] = Stateful
             | ty' `elem` [SoftmaxWithLoss] = Criterion
             | otherwise = Stateless

layerToPurine :: LayerParameter -> G Purine PurineLayer
layerToPurine lp = do
  let blob b = layer' (B b Tensor)
  let op' o = layer' (Op (Computation lp o))
  let optimOp = layer' (Op Optim)

  bottom <- blob Bottom
  gradBottom <- blob GradBottom

  updateOutput <- op' UpdateOutput
  updateGradInput <- op' UpdateGradInput

  bottom >-> updateOutput
  updateGradInput >-> gradBottom

  let purineTy' = (purineTy . layerTy) lp
  case purineTy' of
    Criterion -> do
      -- For criterion, we just have a top blob that connects to Update/Grad
      top <- blob Top
      updateOutput >-> top
      top >-> updateGradInput
      return CriterionLayer{..}
    _ -> do
      top <- blob Top
      gradTop <- blob GradTop
      updateOutput >-> top
      gradTop >-> updateGradInput
      case purineTy' of
        Stateful -> do
            weights <- blob Weights
            gradWeights <- blob GradWeights
            accGradParameters <- op' AccGradParameters
            optim <- optimOp

            gradTop >-> accGradParameters
            weights >-> updateOutput
            weights >-> accGradParameters
            weights >-> updateGradInput
            accGradParameters >-> gradWeights

            -- here's the _trick_ to enforce ordering in the network -
            -- we add a cycle from weight -> optim -> weight, to enforce
            -- the gradients are updated before
            weights >-> optim
            gradWeights >-> optim
            -- BACKEGDE
            optim >-> weights

            return StatefulLayer{..}
        Stateless -> return StatelessLayer{..}
        Criterion -> return $ error "unreachable"

hasOne :: [a] -> Maybe a
hasOne [x] = Just x
hasOne _ = Nothing

insertFrom
  :: Data.Graph.Inductive.Graph.DynGraph gr =>
     Data.Graph.Inductive.Graph.Node
     -> gr a () -> Data.Graph.Inductive.Graph.Node -> gr a ()
insertFrom copySource g'' dest = insEdge (copySource, dest, ()) g''

-- Note that we can do multi-GPU, etc trivially here.
elideCopies :: Gr Purine () -> Gr Purine ()
elideCopies g = foldl elideCopy g [n | (n, Op Copy) <- labNodes g]
    where
      elideCopy g' copyNode = fromMaybe g' modification where
          modification = do
            -- We need to take the source of our copy (a Blob), and
            -- add a link to the users of the destination of our copy
            -- (also a Blob)

            -- a copy node must have one parent and one child for this
            -- to be valid

            copySource <- hasOne $ pre g' copyNode
            copyDest <- hasOne $ suc g' copyNode
            -- the destination of the copy operation must have only
            -- one input.
            _ <- hasOne $ pre g' copyDest
            let copyDestSucs = suc g' copyDest
            return ((delNode copyNode . delNode copyDest) $ foldl (insertFrom copySource) g' copyDestSucs)

findPair :: Eq a => [(a, b)] -> (a, a) -> Maybe (b, b)
findPair xs (x, y) =  (,) <$> lookup x xs <*> lookup y xs

graphToPurine :: Gr LayerParameter () -> G Purine [(Node, PurineLayer)]
graphToPurine layerGr = do
  purineNodes <- forM (labNodes layerGr) layerToPurine'
  let toConnect = map (findPair purineNodes) (edges layerGr)
  forM_ (catMaybes toConnect) connectPurine
  return purineNodes
      where
        layerToPurine' (origNode, layerParameter) = do
          purineLayer <- layerToPurine layerParameter
          return (origNode, purineLayer)
        connectPurine (purineFrom, purineTo) = do
          -- Insert copy nodes - these are optimized out in the single
          -- GPU case, but are left for demonstration purposes
          let copy = layer' (Op Copy)
          forwardCopy <- copy
          backwardCopy <- copy

          top purineFrom >-> forwardCopy
          forwardCopy >-> bottom purineTo

          gradBottom purineTo >-> backwardCopy
          backwardCopy >-> gradTop purineFrom
