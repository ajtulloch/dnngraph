module NN.Graph(module NN.Graph, Gr, Node) where

import           Control.Arrow
import           Control.Monad.State.Strict
import           Data.Graph.Inductive.Graph
import           Data.Graph.Inductive.PatriciaTree

-- Useful Graph Combinators
type G a = State (Node, Gr a ())

sequential :: [a] -> G a (Node, Node)
sequential = stack . map layer

with :: Node -> G a (Node, Node)
with a = return (a, a)

layer :: a -> G a (Node, Node)
layer l = do
  gid <- layer' l
  return (gid, gid)

layer' :: a -> G a Node
layer' l = do
  (gid, s) <- get
  put (gid + 1, insNode (gid, l) s)
  return gid

data Attach = From Node | To Node
attach :: Attach -> a -> G a ()
attach (From n) l = do {l' <- layer' l; n >-> l'}
attach (To n) l = do {l' <- layer' l; l' >-> n}

(>->) :: Node -> Node -> G a ()
(>->) from to = modify (second (insEdge (from, to, ())))

stack :: [G a (Node, Node)] -> G a (Node, Node)
stack = foldl1 (>-)

(>-) :: G a (Node, Node) -> G a (Node, Node) -> G a (Node, Node)
base >- above = do
  (from, midBelow) <- base
  (midAbove, top) <- above
  midBelow >-> midAbove
  return (from, top)
