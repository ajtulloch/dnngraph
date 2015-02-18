{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveFunctor  #-}
module NN.Backend.Torch.Flat where

import           Control.Applicative
import           Control.Lens
import           Control.Monad.State.Strict
import qualified Data.Foldable              as F
import           Data.Graph.Inductive.Graph as G hiding ((&))
import           Data.Graph.Inductive.Query as G
import           Data.Monoid

import           Gen.Caffe.LayerParameter   as LP
import           NN.DSL

data Flat a = Single a
            | Seq [Flat a]
            | Par [Flat a]
              deriving (Show, Functor, F.Foldable, Eq)

nested :: Flat [a] -> Flat a
nested (Single [x]) = Single x
nested (Single xs) = Seq (map Single xs)
nested (Seq xs) = Seq $ map nested xs
nested (Par xs) = Par $ map nested xs

data Tree a = Many a [Tree a] deriving (Functor, Show, F.Foldable)

simplify :: (Eq a ) => Flat a -> Flat a
simplify = until (\x -> simplify' x == x) simplify'
    where
      simplify' (Seq [Single z]) = Single z
      simplify' (Seq zs) = Seq (concatMap acc' zs)
          where
            acc' (Single z)= [Single z]
            acc' (Seq zs') = zs'
            acc' (Par zs') = [Par (map simplify' zs')]
      simplify' z = z

expand :: Net -> Node -> Tree Node
expand gr root = case G.suc gr root of
                   xs -> Many root $ map (expand gr) xs

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

head' :: [a] -> Maybe a
head' [] = Nothing
head' (x:_)  = Just x

findCommonSubtree :: Eq a => [Tree a] -> Maybe ([Tree a], Tree a)
findCommonSubtree [] = Nothing
findCommonSubtree [x] = Just ([], x)
findCommonSubtree r@(x:xs) = do
  v <- el
  subtree <- find v x
  let prefixes = map (removeSubtree v) r
  return (prefixes, subtree)
    where
      elements' = F.toList x
      inAllTrees v = F.and $ map (F.elem v) xs
      el = head' $ filter inAllTrees elements'

expand' :: Net -> Tree Node
expand' gr = expand gr ((head . topsort) gr)

flattenStructure :: Net -> Maybe (Flat Node)
flattenStructure gr = expand' gr & flatten & liftM simplify

flatten' :: Net -> Maybe (Flat LayerParameter)
flatten' gr = do
  flattened <- flattenStructure gr
  return $ (lab' . context gr) <$> flattened
