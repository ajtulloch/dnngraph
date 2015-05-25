{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.Phase  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data Phase = TRAIN
           | TEST
           deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''Phase

 
instance P'.Mergeable Phase
 
instance Prelude'.Bounded Phase where
  minBound = TRAIN
  maxBound = TEST
 
instance P'.Default Phase where
  defaultValue = TRAIN
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe Phase
toMaybe'Enum 0 = Prelude'.Just TRAIN
toMaybe'Enum 1 = Prelude'.Just TEST
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum Phase where
  fromEnum TRAIN = 0
  fromEnum TEST = 1
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.Phase") . toMaybe'Enum
  succ TRAIN = TEST
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.Phase"
  pred TEST = TRAIN
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.Phase"
 
instance P'.Wire Phase where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB Phase
 
instance P'.MessageAPI msg' (msg' -> Phase) Phase where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum Phase where
  reflectEnum = [(0, "TRAIN", TRAIN), (1, "TEST", TEST)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.Phase") ["Gen"] ["Caffe"] "Phase") ["Gen", "Caffe", "Phase.hs"]
      [(0, "TRAIN"), (1, "TEST")]