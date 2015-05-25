{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.InnerProductParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.FillerParameter as Caffe (FillerParameter)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data InnerProductParameter = InnerProductParameter{num_output :: !(P'.Maybe P'.Word32), bias_term :: !(P'.Maybe P'.Bool),
                                                   weight_filler :: !(P'.Maybe Caffe.FillerParameter),
                                                   bias_filler :: !(P'.Maybe Caffe.FillerParameter), axis :: !(P'.Maybe P'.Int32)}
                           deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''InnerProductParameter

 
instance P'.Mergeable InnerProductParameter where
  mergeAppend (InnerProductParameter x'1 x'2 x'3 x'4 x'5) (InnerProductParameter y'1 y'2 y'3 y'4 y'5)
   = InnerProductParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
 
instance P'.Default InnerProductParameter where
  defaultValue
   = InnerProductParameter P'.defaultValue (Prelude'.Just Prelude'.True) P'.defaultValue P'.defaultValue (Prelude'.Just 1)
 
instance P'.Wire InnerProductParameter where
  wireSize ft' self'@(InnerProductParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeOpt 1 11 x'3 + P'.wireSizeOpt 1 11 x'4 +
             P'.wireSizeOpt 1 5 x'5)
  wirePut ft' self'@(InnerProductParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 13 x'1
             P'.wirePutOpt 16 8 x'2
             P'.wirePutOpt 26 11 x'3
             P'.wirePutOpt 34 11 x'4
             P'.wirePutOpt 40 5 x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{num_output = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{bias_term = Prelude'.Just new'Field}) (P'.wireGet 8)
             26 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{weight_filler = P'.mergeAppend (weight_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             34 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{bias_filler = P'.mergeAppend (bias_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{axis = Prelude'.Just new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> InnerProductParameter) InnerProductParameter where
  getVal m' f' = f' m'
 
instance P'.GPB InnerProductParameter
 
instance P'.ReflectDescriptor InnerProductParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 26, 34, 40])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.InnerProductParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"InnerProductParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"InnerProductParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.num_output\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"num_output\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.bias_term\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"bias_term\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.weight_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"weight_filler\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.bias_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"bias_filler\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.InnerProductParameter.axis\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"InnerProductParameter\"], baseName' = FName \"axis\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"