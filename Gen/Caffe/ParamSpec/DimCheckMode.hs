{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.ParamSpec.DimCheckMode  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data DimCheckMode = STRICT
                  | PERMISSIVE
                  deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''DimCheckMode

 
instance P'.Mergeable DimCheckMode
 
instance Prelude'.Bounded DimCheckMode where
  minBound = STRICT
  maxBound = PERMISSIVE
 
instance P'.Default DimCheckMode where
  defaultValue = STRICT
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe DimCheckMode
toMaybe'Enum 0 = Prelude'.Just STRICT
toMaybe'Enum 1 = Prelude'.Just PERMISSIVE
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum DimCheckMode where
  fromEnum STRICT = 0
  fromEnum PERMISSIVE = 1
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.ParamSpec.DimCheckMode") . toMaybe'Enum
  succ STRICT = PERMISSIVE
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.ParamSpec.DimCheckMode"
  pred PERMISSIVE = STRICT
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.ParamSpec.DimCheckMode"
 
instance P'.Wire DimCheckMode where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB DimCheckMode
 
instance P'.MessageAPI msg' (msg' -> DimCheckMode) DimCheckMode where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum DimCheckMode where
  reflectEnum = [(0, "STRICT", STRICT), (1, "PERMISSIVE", PERMISSIVE)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.ParamSpec.DimCheckMode") ["Gen"] ["Caffe", "ParamSpec"] "DimCheckMode")
      ["Gen", "Caffe", "ParamSpec", "DimCheckMode.hs"]
      [(0, "STRICT"), (1, "PERMISSIVE")]