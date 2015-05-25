{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.TransformationParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data TransformationParameter = TransformationParameter{scale :: !(P'.Maybe P'.Float), mirror :: !(P'.Maybe P'.Bool),
                                                       crop_size :: !(P'.Maybe P'.Word32), mean_file :: !(P'.Maybe P'.Utf8),
                                                       mean_value :: !(P'.Seq P'.Float)}
                             deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''TransformationParameter

 
instance P'.Mergeable TransformationParameter where
  mergeAppend (TransformationParameter x'1 x'2 x'3 x'4 x'5) (TransformationParameter y'1 y'2 y'3 y'4 y'5)
   = TransformationParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
 
instance P'.Default TransformationParameter where
  defaultValue
   = TransformationParameter (Prelude'.Just 1.0) (Prelude'.Just Prelude'.False) (Prelude'.Just 0) P'.defaultValue P'.defaultValue
 
instance P'.Wire TransformationParameter where
  wireSize ft' self'@(TransformationParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 2 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 9 x'4 +
             P'.wireSizeRep 1 2 x'5)
  wirePut ft' self'@(TransformationParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 13 2 x'1
             P'.wirePutOpt 16 8 x'2
             P'.wirePutOpt 24 13 x'3
             P'.wirePutOpt 34 9 x'4
             P'.wirePutRep 45 2 x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             13 -> Prelude'.fmap (\ !new'Field -> old'Self{scale = Prelude'.Just new'Field}) (P'.wireGet 2)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{mirror = Prelude'.Just new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{crop_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{mean_file = Prelude'.Just new'Field}) (P'.wireGet 9)
             45 -> Prelude'.fmap (\ !new'Field -> old'Self{mean_value = P'.append (mean_value old'Self) new'Field}) (P'.wireGet 2)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{mean_value = P'.mergeAppend (mean_value old'Self) new'Field})
                    (P'.wireGetPacked 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> TransformationParameter) TransformationParameter where
  getVal m' f' = f' m'
 
instance P'.GPB TransformationParameter
 
instance P'.ReflectDescriptor TransformationParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [13, 16, 24, 34, 42, 45])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.TransformationParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"TransformationParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"TransformationParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.scale\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"scale\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 13}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.mirror\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"mirror\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.crop_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"crop_size\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.mean_file\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"mean_file\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.TransformationParameter.mean_value\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"TransformationParameter\"], baseName' = FName \"mean_value\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 45}, packedTag = Just (WireTag {getWireTag = 45},WireTag {getWireTag = 42}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"