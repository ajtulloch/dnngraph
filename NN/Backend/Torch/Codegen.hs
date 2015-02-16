{-# LANGUAGE DeriveFunctor              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
module NN.Backend.Torch.Codegen where

import           Control.Applicative
import           Control.Lens               hiding (assign)
import           Control.Monad.State.Strict
import           Language.Lua.PrettyPrinter
import           Language.Lua.Syntax
import           Text.Printf

import           NN.Backend.Torch.Lua
import           NN.Backend.Torch.Torch
import           NN.DSL

data TorchState = TorchState {
      _statements :: [Stat],
      _sequential :: Maybe String,
      _criteria   :: [String],
      _count      :: Int
    }
makeLenses ''TorchState

newtype Torch a = Torch { _unTorch :: State TorchState a }
    deriving (Functor, Applicative, Monad, MonadState TorchState)

initialize :: Torch ()
initialize = do
  seq' <- fresh "seq"
  sequential ?= seq'

  statements <>= [require "nn"]
  statements <>= [assign seq' $ torchExp (TorchModule "nn" "Sequential" [])]
      where
        require module' = funCall "require" [toLua $ L module']

fresh :: String -> Torch String
fresh prefix = do
  c <- use count
  count += 1
  return $ printf "%s%d" prefix c

insertModule :: Module Exp -> Torch ()
insertModule (Criterion exp') = do
  name' <- fresh "criterion"
  criteria <>= [name']
  statements <>= [assign name' exp']

insertModule (Inner exp') = do
  Just seq' <- use sequential
  statements <>= [methCall seq' "add" [exp']]

finalize :: Torch Block
finalize = do
  Just seq' <- use sequential
  criteria' <- use criteria
  statements' <- use statements
  return $ Block statements' (Just $ return' <$> seq':criteria')

runTorch :: [LayerParameter] -> Torch Block
runTorch layers = do
  initialize
  forM_ exps insertModule
  finalize
    where
      exps = concatMap torchExps layers
      torchExps lp = (torchExp <$>) <$> torchModules lp

lower :: [LayerParameter] -> Block
lower layers = (evalState . _unTorch) (runTorch layers) emptyTorch
    where
      emptyTorch = TorchState [] Nothing [] 0

codegen :: Block -> String
codegen block = pprint block & renderPretty 0.4 150 & displayS & \f -> f ""
