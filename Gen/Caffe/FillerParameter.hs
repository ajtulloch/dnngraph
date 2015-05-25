{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.FillerParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data FillerParameter = FillerParameter{type' :: !(P'.Maybe P'.Utf8), value :: !(P'.Maybe P'.Float), min :: !(P'.Maybe P'.Float),
                                       max :: !(P'.Maybe P'.Float), mean :: !(P'.Maybe P'.Float), std :: !(P'.Maybe P'.Float),
                                       sparse :: !(P'.Maybe P'.Int32)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''FillerParameter

 
instance P'.Mergeable FillerParameter where
  mergeAppend (FillerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7) (FillerParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7)
   = FillerParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
 
instance P'.Default FillerParameter where
  defaultValue
   = FillerParameter (Prelude'.Just (P'.Utf8 (P'.pack "constant"))) (Prelude'.Just 0.0) (Prelude'.Just 0.0) (Prelude'.Just 1.0)
      (Prelude'.Just 0.0)
      (Prelude'.Just 1.0)
      (Prelude'.Just (-1))
 
instance P'.Wire FillerParameter where
  wireSize ft' self'@(FillerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 2 x'2 + P'.wireSizeOpt 1 2 x'3 + P'.wireSizeOpt 1 2 x'4 +
             P'.wireSizeOpt 1 2 x'5
             + P'.wireSizeOpt 1 2 x'6
             + P'.wireSizeOpt 1 5 x'7)
  wirePut ft' self'@(FillerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7)
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
             P'.wirePutOpt 21 2 x'2
             P'.wirePutOpt 29 2 x'3
             P'.wirePutOpt 37 2 x'4
             P'.wirePutOpt 45 2 x'5
             P'.wirePutOpt 53 2 x'6
             P'.wirePutOpt 56 5 x'7
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             21 -> Prelude'.fmap (\ !new'Field -> old'Self{value = Prelude'.Just new'Field}) (P'.wireGet 2)
             29 -> Prelude'.fmap (\ !new'Field -> old'Self{min = Prelude'.Just new'Field}) (P'.wireGet 2)
             37 -> Prelude'.fmap (\ !new'Field -> old'Self{max = Prelude'.Just new'Field}) (P'.wireGet 2)
             45 -> Prelude'.fmap (\ !new'Field -> old'Self{mean = Prelude'.Just new'Field}) (P'.wireGet 2)
             53 -> Prelude'.fmap (\ !new'Field -> old'Self{std = Prelude'.Just new'Field}) (P'.wireGet 2)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{sparse = Prelude'.Just new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> FillerParameter) FillerParameter where
  getVal m' f' = f' m'
 
instance P'.GPB FillerParameter
 
instance P'.ReflectDescriptor FillerParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 21, 29, 37, 45, 53, 56])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"FillerParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.FillerParameter.type\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"FillerParameter\"], baseName' = FName \"type'\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"constant\", hsDefault = Just (HsDef'ByteString \"constant\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.FillerParameter.value\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"FillerParameter\"], baseName' = FName \"value\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (0 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.FillerParameter.min\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"FillerParameter\"], baseName' = FName \"min\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 29}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (0 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.FillerParameter.max\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"FillerParameter\"], baseName' = FName \"max\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 37}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.FillerParameter.mean\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"FillerParameter\"], baseName' = FName \"mean\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 45}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (0 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.FillerParameter.std\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"FillerParameter\"], baseName' = FName \"std\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 53}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.FillerParameter.sparse\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"FillerParameter\"], baseName' = FName \"sparse\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"-1\", hsDefault = Just (HsDef'Integer (-1))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"