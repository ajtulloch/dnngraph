{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SPPParameter.Engine  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data Engine = DEFAULT
            | CAFFE
            | CUDNN
            deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''Engine

 
instance P'.Mergeable Engine
 
instance Prelude'.Bounded Engine where
  minBound = DEFAULT
  maxBound = CUDNN
 
instance P'.Default Engine where
  defaultValue = DEFAULT
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe Engine
toMaybe'Enum 0 = Prelude'.Just DEFAULT
toMaybe'Enum 1 = Prelude'.Just CAFFE
toMaybe'Enum 2 = Prelude'.Just CUDNN
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum Engine where
  fromEnum DEFAULT = 0
  fromEnum CAFFE = 1
  fromEnum CUDNN = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.SPPParameter.Engine") . toMaybe'Enum
  succ DEFAULT = CAFFE
  succ CAFFE = CUDNN
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.SPPParameter.Engine"
  pred CAFFE = DEFAULT
  pred CUDNN = CAFFE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.SPPParameter.Engine"
 
instance P'.Wire Engine where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB Engine
 
instance P'.MessageAPI msg' (msg' -> Engine) Engine where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum Engine where
  reflectEnum = [(0, "DEFAULT", DEFAULT), (1, "CAFFE", CAFFE), (2, "CUDNN", CUDNN)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.SPPParameter.Engine") ["Gen"] ["Caffe", "SPPParameter"] "Engine")
      ["Gen", "Caffe", "SPPParameter", "Engine.hs"]
      [(0, "DEFAULT"), (1, "CAFFE"), (2, "CUDNN")]