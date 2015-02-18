{-# LANGUAGE DeriveFoldable    #-}
{-# LANGUAGE DeriveFunctor     #-}
{-# LANGUAGE DeriveTraversable #-}
module NN.Backend.Torch.Flat where

import           Control.Applicative
import           Control.Lens
import           Control.Monad.State.Strict
import qualified Data.Foldable              as F
import           Data.Graph.Inductive.Graph as G hiding ((&))
import           Data.Graph.Inductive.Query as G
import           Data.Monoid
import qualified Data.Traversable           as T
import           Gen.Caffe.LayerParameter   as LP
import           NN.DSL

data Flat a = Single a
            | Seq [Flat a]
            | Par [Flat a]
              deriving (Eq, Show, Functor, F.Foldable, T.Traversable)

nested :: Flat [a] -> Flat a
nested (Single xs) = Seq (map Single xs)
nested (Seq xs) = Seq (map nested xs)
nested (Par xs) = Par (map nested xs)

simplify :: Eq a => Flat a -> Flat a
simplify = until (\x -> simplify' x == x) simplify'
    where
      simplify' (Seq [Single z]) = Single z
      simplify' (Seq zs) = Seq (concatMap acc' zs)
          where
            acc' (Single z) = [Single z]
            acc' (Seq zs') = zs'
            acc' (Par zs') = [Par (map simplify' zs')]
      simplify' z = z

data Tree a = Many a [Tree a]
              deriving (Eq, Show, Functor, F.Foldable, T.Traversable)

expand :: Net -> Node -> Tree Node
expand gr root = Many root (map (expand gr) (G.suc gr root))

find :: Eq a => a -> Tree a -> Maybe (Tree a)
find query (Many root xs) =
    if query == root then Just (Many root xs)
    else getFirst $ mconcat (map (First . find query) xs)

removeSubtree :: Eq a => a -> Tree a -> Tree a
removeSubtree query (Many root xs) =
    Many root (filter (\(Many v _) -> v /= query) (map (removeSubtree query) xs))

flatten :: Eq a => Tree a -> Maybe (Flat a)
flatten (Many node []) = Just (Single node)
flatten (Many node [x]) = do
  v <- flatten x
  return $ Seq [Single node, v]
flatten (Many node xs) = do
  (forks, joined) <- findCommonSubtree xs
  joined' <- flatten joined
  forks' <- mapM flatten forks
  return $ Seq [Single node, Par forks', joined']

findCommonSubtree :: Eq a => [Tree a] -> Maybe ([Tree a], Tree a)
findCommonSubtree [] = Nothing
findCommonSubtree [x] = Just ([], x)
findCommonSubtree r@(x:xs) = do
  v <- commonElement
  subtree <- find v x
  return (removeSubtree v <$> r, subtree)
    where
      inAllTrees v = (F.and . (F.elem v <$>)) xs
      commonElement = head' $ filter inAllTrees (F.toList x)
      head' [] = Nothing
      head' (y:_)  = Just y

expand' :: Net -> Tree Node
expand' gr = expand gr ((head . topsort) gr)

flattenStructure :: Net -> Maybe (Flat Node)
flattenStructure gr = expand' gr & flatten & liftM simplify

flatten' :: Net -> Maybe (Flat LayerParameter)
flatten' gr = do
  flattened <- flattenStructure gr
  return $ (lab' . context gr) <$> flattened
