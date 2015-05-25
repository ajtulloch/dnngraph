{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.AccuracyParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data AccuracyParameter = AccuracyParameter{top_k :: !(P'.Maybe P'.Word32), axis :: !(P'.Maybe P'.Int32),
                                           ignore_label :: !(P'.Maybe P'.Int32)}
                       deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''AccuracyParameter

 
instance P'.Mergeable AccuracyParameter where
  mergeAppend (AccuracyParameter x'1 x'2 x'3) (AccuracyParameter y'1 y'2 y'3)
   = AccuracyParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default AccuracyParameter where
  defaultValue = AccuracyParameter (Prelude'.Just 1) (Prelude'.Just 1) P'.defaultValue
 
instance P'.Wire AccuracyParameter where
  wireSize ft' self'@(AccuracyParameter x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeOpt 1 5 x'3)
  wirePut ft' self'@(AccuracyParameter x'1 x'2 x'3)
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
             P'.wirePutOpt 16 5 x'2
             P'.wirePutOpt 24 5 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{top_k = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{axis = Prelude'.Just new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{ignore_label = Prelude'.Just new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> AccuracyParameter) AccuracyParameter where
  getVal m' f' = f' m'
 
instance P'.GPB AccuracyParameter
 
instance P'.ReflectDescriptor AccuracyParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.AccuracyParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"AccuracyParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"AccuracyParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.AccuracyParameter.top_k\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"AccuracyParameter\"], baseName' = FName \"top_k\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.AccuracyParameter.axis\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"AccuracyParameter\"], baseName' = FName \"axis\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.AccuracyParameter.ignore_label\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"AccuracyParameter\"], baseName' = FName \"ignore_label\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"