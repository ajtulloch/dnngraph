{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.PurineNetParameter.Operation  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data Operation = Computation
               | Optim
               | Copy
               deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''Operation

 
instance P'.Mergeable Operation
 
instance Prelude'.Bounded Operation where
  minBound = Computation
  maxBound = Copy
 
instance P'.Default Operation where
  defaultValue = Computation
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe Operation
toMaybe'Enum 1 = Prelude'.Just Computation
toMaybe'Enum 2 = Prelude'.Just Optim
toMaybe'Enum 3 = Prelude'.Just Copy
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum Operation where
  fromEnum Computation = 1
  fromEnum Optim = 2
  fromEnum Copy = 3
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.PurineNetParameter.Operation") .
      toMaybe'Enum
  succ Computation = Optim
  succ Optim = Copy
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.PurineNetParameter.Operation"
  pred Optim = Computation
  pred Copy = Optim
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.PurineNetParameter.Operation"
 
instance P'.Wire Operation where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB Operation
 
instance P'.MessageAPI msg' (msg' -> Operation) Operation where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum Operation where
  reflectEnum = [(1, "Computation", Computation), (2, "Optim", Optim), (3, "Copy", Copy)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.PurineNetParameter.Operation") ["Gen"] ["Caffe", "PurineNetParameter"] "Operation")
      ["Gen", "Caffe", "PurineNetParameter", "Operation.hs"]
      [(1, "Computation"), (2, "Optim"), (3, "Copy")]