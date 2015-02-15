module NN.Backend.Torch.Lua where

import           Data.Word
import           Language.Lua.Syntax

newtype LS = L String

-- |Handy typeclass for converting arguments
class ToLua a where
    toLua :: a -> Exp

instance ToLua Word32 where
    toLua = Number . show

instance ToLua LS where
    toLua (L s') = String s'

instance ToLua Float where
    toLua = Number . show

instance (ToLua a) => ToLua (Maybe a) where
    toLua Nothing = Nil
    toLua (Just a) = toLua a

-- Helpers for Lua code generation
assign lval exp' = LocalAssign [lval] (Just [exp'])
funCall name' args = FunCall (NormalFunCall (var name') (Args args))
methCall table field args = FunCall (MethodCall (var table) field (Args args))
return' name' = PrefixExp (var name')
var name' = PEVar (VarName name')
