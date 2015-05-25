{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.BlobProto  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data BlobProto = BlobProto{num :: !(P'.Maybe P'.Int32), channels :: !(P'.Maybe P'.Int32), height :: !(P'.Maybe P'.Int32),
                           width :: !(P'.Maybe P'.Int32), data' :: !(P'.Seq P'.Float), diff :: !(P'.Seq P'.Float)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''BlobProto

 
instance P'.Mergeable BlobProto where
  mergeAppend (BlobProto x'1 x'2 x'3 x'4 x'5 x'6) (BlobProto y'1 y'2 y'3 y'4 y'5 y'6)
   = BlobProto (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
 
instance P'.Default BlobProto where
  defaultValue = BlobProto (Prelude'.Just 0) (Prelude'.Just 0) (Prelude'.Just 0) (Prelude'.Just 0) P'.defaultValue P'.defaultValue
 
instance P'.Wire BlobProto where
  wireSize ft' self'@(BlobProto x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeOpt 1 5 x'3 + P'.wireSizeOpt 1 5 x'4 +
             P'.wireSizePacked 1 2 x'5
             + P'.wireSizePacked 1 2 x'6)
  wirePut ft' self'@(BlobProto x'1 x'2 x'3 x'4 x'5 x'6)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 5 x'1
             P'.wirePutOpt 16 5 x'2
             P'.wirePutOpt 24 5 x'3
             P'.wirePutOpt 32 5 x'4
             P'.wirePutPacked 42 2 x'5
             P'.wirePutPacked 50 2 x'6
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{num = Prelude'.Just new'Field}) (P'.wireGet 5)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{channels = Prelude'.Just new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{height = Prelude'.Just new'Field}) (P'.wireGet 5)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{width = Prelude'.Just new'Field}) (P'.wireGet 5)
             45 -> Prelude'.fmap (\ !new'Field -> old'Self{data' = P'.append (data' old'Self) new'Field}) (P'.wireGet 2)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{data' = P'.mergeAppend (data' old'Self) new'Field}) (P'.wireGetPacked 2)
             53 -> Prelude'.fmap (\ !new'Field -> old'Self{diff = P'.append (diff old'Self) new'Field}) (P'.wireGet 2)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{diff = P'.mergeAppend (diff old'Self) new'Field}) (P'.wireGetPacked 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> BlobProto) BlobProto where
  getVal m' f' = f' m'
 
instance P'.GPB BlobProto
 
instance P'.ReflectDescriptor BlobProto where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 32, 42, 45, 50, 53])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.BlobProto\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobProto\"}, descFilePath = [\"Gen\",\"Caffe\",\"BlobProto.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobProto.num\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobProto\"], baseName' = FName \"num\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobProto.channels\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobProto\"], baseName' = FName \"channels\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobProto.height\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobProto\"], baseName' = FName \"height\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobProto.width\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobProto\"], baseName' = FName \"width\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobProto.data\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobProto\"], baseName' = FName \"data'\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Just (WireTag {getWireTag = 45},WireTag {getWireTag = 42}), wireTagLength = 1, isPacked = True, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobProto.diff\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobProto\"], baseName' = FName \"diff\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Just (WireTag {getWireTag = 53},WireTag {getWireTag = 50}), wireTagLength = 1, isPacked = True, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"