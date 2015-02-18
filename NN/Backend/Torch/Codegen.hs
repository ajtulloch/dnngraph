{-# LANGUAGE DeriveFunctor              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
module NN.Backend.Torch.Codegen where

import           Control.Applicative
import           Control.Lens               hiding (assign)
import           Control.Monad.State.Strict
import qualified Data.Foldable              as F
import           Gen.Caffe.LayerParameter   as LP
import           Language.Lua.PrettyPrinter
import           Language.Lua.Syntax
import           NN.Backend.Torch.Flat
import           NN.Backend.Torch.Lua
import           NN.Backend.Torch.Torch
import           Text.Printf


data TorchState = TorchState {
      _statements :: [Stat],
      _count      :: Int
    }
makeLenses ''TorchState

newtype Torch a = Torch { _unTorch :: State TorchState a }
    deriving (Functor, Applicative, Monad, MonadState TorchState)

sequential' :: Exp
sequential' = torchExp (TorchModule "nn" "Sequential" [])

depthConcat' :: Exp
depthConcat' = torchExp (TorchModule "nn" "DepthConcat" [])

imports :: Torch ()
imports = statements <>= [require "nn"]

fresh :: String -> Torch String
fresh prefix = do
  c <- use count
  count += 1
  return $ printf "%s%d" prefix c

finalize :: Name -> [Exp] -> Torch Block
finalize id' criteria' = do
  criteriaNames' <- forM criteria' $
                         \exp' -> do
                           name' <- fresh "criteria"
                           statements <>= [assign name' exp']
                           return name'

  statements' <- use statements
  return $ Block statements' (Just $ return' <$> id':criteriaNames')


insert :: Flat Exp -> Torch Name
insert (Single exp') = do
  name' <- fresh "mod"
  statements <>= [assign name' exp']
  return name'
insert (Seq exps') = do
  name' <- fresh "seq"
  statements <>= [assign name' sequential']
  forM_ exps' $ \exp' ->
      do
        innerName' <- insert exp'
        statements <>= [methCall name' "add" [var' innerName']]
  return name'
insert (Par exps') = do
  name' <- fresh "concat"
  statements <>= [assign name' depthConcat']
  forM_ exps' $ \exp' ->
      do
        innerName' <- insert exp'
        statements <>= [methCall name' "add" [var' innerName']]
  return name'
runTorch :: Flat LayerParameter -> Torch Block
runTorch root = do
  imports
  id' <- insert flatInner
  finalize id' criteriaExps
      where
        exped = (((torchExp <$>) <$>) . torchModules) <$> root
        innerExps = inners <$> exped
        criteriaExps = F.concatMap id (criteria <$> exped)
        flatInner = (simplify . nested) innerExps

lower :: Flat LayerParameter -> Block
lower layers = (evalState . _unTorch) (runTorch layers) emptyTorch
    where
      emptyTorch = TorchState [] 0

codegen :: Block -> String
codegen block = pprint block & renderPretty 0.4 200 & displayS & \f -> f ""
