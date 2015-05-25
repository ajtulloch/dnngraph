{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.DataParameter.DB  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data DB = LEVELDB
        | LMDB
        deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''DB

 
instance P'.Mergeable DB
 
instance Prelude'.Bounded DB where
  minBound = LEVELDB
  maxBound = LMDB
 
instance P'.Default DB where
  defaultValue = LEVELDB
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe DB
toMaybe'Enum 0 = Prelude'.Just LEVELDB
toMaybe'Enum 1 = Prelude'.Just LMDB
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum DB where
  fromEnum LEVELDB = 0
  fromEnum LMDB = 1
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.DataParameter.DB") . toMaybe'Enum
  succ LEVELDB = LMDB
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.DataParameter.DB"
  pred LMDB = LEVELDB
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.DataParameter.DB"
 
instance P'.Wire DB where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB DB
 
instance P'.MessageAPI msg' (msg' -> DB) DB where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum DB where
  reflectEnum = [(0, "LEVELDB", LEVELDB), (1, "LMDB", LMDB)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.DataParameter.DB") ["Gen"] ["Caffe", "DataParameter"] "DB")
      ["Gen", "Caffe", "DataParameter", "DB.hs"]
      [(0, "LEVELDB"), (1, "LMDB")]