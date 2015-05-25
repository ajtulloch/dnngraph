{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.HingeLossParameter.Norm  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data Norm = L1
          | L2
          deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''Norm

 
instance P'.Mergeable Norm
 
instance Prelude'.Bounded Norm where
  minBound = L1
  maxBound = L2
 
instance P'.Default Norm where
  defaultValue = L1
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe Norm
toMaybe'Enum 1 = Prelude'.Just L1
toMaybe'Enum 2 = Prelude'.Just L2
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum Norm where
  fromEnum L1 = 1
  fromEnum L2 = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.HingeLossParameter.Norm") .
      toMaybe'Enum
  succ L1 = L2
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.HingeLossParameter.Norm"
  pred L2 = L1
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.HingeLossParameter.Norm"
 
instance P'.Wire Norm where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB Norm
 
instance P'.MessageAPI msg' (msg' -> Norm) Norm where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum Norm where
  reflectEnum = [(1, "L1", L1), (2, "L2", L2)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.HingeLossParameter.Norm") ["Gen"] ["Caffe", "HingeLossParameter"] "Norm")
      ["Gen", "Caffe", "HingeLossParameter", "Norm.hs"]
      [(1, "L1"), (2, "L2")]