{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.PythonParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data PythonParameter = PythonParameter{module' :: !(P'.Maybe P'.Utf8), layer :: !(P'.Maybe P'.Utf8)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''PythonParameter

 
instance P'.Mergeable PythonParameter where
  mergeAppend (PythonParameter x'1 x'2) (PythonParameter y'1 y'2)
   = PythonParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default PythonParameter where
  defaultValue = PythonParameter P'.defaultValue P'.defaultValue
 
instance P'.Wire PythonParameter where
  wireSize ft' self'@(PythonParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2)
  wirePut ft' self'@(PythonParameter x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'1
             P'.wirePutOpt 18 9 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{module' = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{layer = Prelude'.Just new'Field}) (P'.wireGet 9)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> PythonParameter) PythonParameter where
  getVal m' f' = f' m'
 
instance P'.GPB PythonParameter
 
instance P'.ReflectDescriptor PythonParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.PythonParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PythonParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"PythonParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PythonParameter.module\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PythonParameter\"], baseName' = FName \"module'\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PythonParameter.layer\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PythonParameter\"], baseName' = FName \"layer\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"