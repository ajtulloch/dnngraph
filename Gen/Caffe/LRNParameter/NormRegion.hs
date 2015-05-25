{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.LRNParameter.NormRegion  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data NormRegion = ACROSS_CHANNELS
                | WITHIN_CHANNEL
                deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''NormRegion

 
instance P'.Mergeable NormRegion
 
instance Prelude'.Bounded NormRegion where
  minBound = ACROSS_CHANNELS
  maxBound = WITHIN_CHANNEL
 
instance P'.Default NormRegion where
  defaultValue = ACROSS_CHANNELS
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe NormRegion
toMaybe'Enum 0 = Prelude'.Just ACROSS_CHANNELS
toMaybe'Enum 1 = Prelude'.Just WITHIN_CHANNEL
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum NormRegion where
  fromEnum ACROSS_CHANNELS = 0
  fromEnum WITHIN_CHANNEL = 1
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.LRNParameter.NormRegion") .
      toMaybe'Enum
  succ ACROSS_CHANNELS = WITHIN_CHANNEL
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.LRNParameter.NormRegion"
  pred WITHIN_CHANNEL = ACROSS_CHANNELS
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.LRNParameter.NormRegion"
 
instance P'.Wire NormRegion where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB NormRegion
 
instance P'.MessageAPI msg' (msg' -> NormRegion) NormRegion where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum NormRegion where
  reflectEnum = [(0, "ACROSS_CHANNELS", ACROSS_CHANNELS), (1, "WITHIN_CHANNEL", WITHIN_CHANNEL)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.LRNParameter.NormRegion") ["Gen"] ["Caffe", "LRNParameter"] "NormRegion")
      ["Gen", "Caffe", "LRNParameter", "NormRegion.hs"]
      [(0, "ACROSS_CHANNELS"), (1, "WITHIN_CHANNEL")]