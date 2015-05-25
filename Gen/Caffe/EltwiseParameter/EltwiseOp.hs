{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.EltwiseParameter.EltwiseOp  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data EltwiseOp = PROD
               | SUM
               | MAX
               deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''EltwiseOp

 
instance P'.Mergeable EltwiseOp
 
instance Prelude'.Bounded EltwiseOp where
  minBound = PROD
  maxBound = MAX
 
instance P'.Default EltwiseOp where
  defaultValue = PROD
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe EltwiseOp
toMaybe'Enum 0 = Prelude'.Just PROD
toMaybe'Enum 1 = Prelude'.Just SUM
toMaybe'Enum 2 = Prelude'.Just MAX
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum EltwiseOp where
  fromEnum PROD = 0
  fromEnum SUM = 1
  fromEnum MAX = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.EltwiseParameter.EltwiseOp") .
      toMaybe'Enum
  succ PROD = SUM
  succ SUM = MAX
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.EltwiseParameter.EltwiseOp"
  pred SUM = PROD
  pred MAX = SUM
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.EltwiseParameter.EltwiseOp"
 
instance P'.Wire EltwiseOp where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB EltwiseOp
 
instance P'.MessageAPI msg' (msg' -> EltwiseOp) EltwiseOp where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum EltwiseOp where
  reflectEnum = [(0, "PROD", PROD), (1, "SUM", SUM), (2, "MAX", MAX)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.EltwiseParameter.EltwiseOp") ["Gen"] ["Caffe", "EltwiseParameter"] "EltwiseOp")
      ["Gen", "Caffe", "EltwiseParameter", "EltwiseOp.hs"]
      [(0, "PROD"), (1, "SUM"), (2, "MAX")]