{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.PurineNetParameter.Direction  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data Direction = UpdateOutput
               | UpdateGradInput
               | AccGradParameters
               deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''Direction

 
instance P'.Mergeable Direction
 
instance Prelude'.Bounded Direction where
  minBound = UpdateOutput
  maxBound = AccGradParameters
 
instance P'.Default Direction where
  defaultValue = UpdateOutput
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe Direction
toMaybe'Enum 1 = Prelude'.Just UpdateOutput
toMaybe'Enum 2 = Prelude'.Just UpdateGradInput
toMaybe'Enum 3 = Prelude'.Just AccGradParameters
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum Direction where
  fromEnum UpdateOutput = 1
  fromEnum UpdateGradInput = 2
  fromEnum AccGradParameters = 3
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.PurineNetParameter.Direction") .
      toMaybe'Enum
  succ UpdateOutput = UpdateGradInput
  succ UpdateGradInput = AccGradParameters
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.PurineNetParameter.Direction"
  pred UpdateGradInput = UpdateOutput
  pred AccGradParameters = UpdateGradInput
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.PurineNetParameter.Direction"
 
instance P'.Wire Direction where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB Direction
 
instance P'.MessageAPI msg' (msg' -> Direction) Direction where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum Direction where
  reflectEnum
   = [(1, "UpdateOutput", UpdateOutput), (2, "UpdateGradInput", UpdateGradInput), (3, "AccGradParameters", AccGradParameters)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.PurineNetParameter.Direction") ["Gen"] ["Caffe", "PurineNetParameter"] "Direction")
      ["Gen", "Caffe", "PurineNetParameter", "Direction.hs"]
      [(1, "UpdateOutput"), (2, "UpdateGradInput"), (3, "AccGradParameters")]