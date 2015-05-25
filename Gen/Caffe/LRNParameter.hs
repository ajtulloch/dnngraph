{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.LRNParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.LRNParameter.NormRegion as Caffe.LRNParameter (NormRegion)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data LRNParameter = LRNParameter{local_size :: !(P'.Maybe P'.Word32), alpha :: !(P'.Maybe P'.Float), beta :: !(P'.Maybe P'.Float),
                                 norm_region :: !(P'.Maybe Caffe.LRNParameter.NormRegion), k :: !(P'.Maybe P'.Float)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''LRNParameter

 
instance P'.Mergeable LRNParameter where
  mergeAppend (LRNParameter x'1 x'2 x'3 x'4 x'5) (LRNParameter y'1 y'2 y'3 y'4 y'5)
   = LRNParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
 
instance P'.Default LRNParameter where
  defaultValue
   = LRNParameter (Prelude'.Just 5) (Prelude'.Just 1.0) (Prelude'.Just 0.75) (Prelude'.Just (Prelude'.read "ACROSS_CHANNELS"))
      (Prelude'.Just 1.0)
 
instance P'.Wire LRNParameter where
  wireSize ft' self'@(LRNParameter x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 2 x'2 + P'.wireSizeOpt 1 2 x'3 + P'.wireSizeOpt 1 14 x'4 +
             P'.wireSizeOpt 1 2 x'5)
  wirePut ft' self'@(LRNParameter x'1 x'2 x'3 x'4 x'5)
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
             P'.wirePutOpt 21 2 x'2
             P'.wirePutOpt 29 2 x'3
             P'.wirePutOpt 32 14 x'4
             P'.wirePutOpt 45 2 x'5
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{local_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             21 -> Prelude'.fmap (\ !new'Field -> old'Self{alpha = Prelude'.Just new'Field}) (P'.wireGet 2)
             29 -> Prelude'.fmap (\ !new'Field -> old'Self{beta = Prelude'.Just new'Field}) (P'.wireGet 2)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{norm_region = Prelude'.Just new'Field}) (P'.wireGet 14)
             45 -> Prelude'.fmap (\ !new'Field -> old'Self{k = Prelude'.Just new'Field}) (P'.wireGet 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> LRNParameter) LRNParameter where
  getVal m' f' = f' m'
 
instance P'.GPB LRNParameter
 
instance P'.ReflectDescriptor LRNParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 21, 29, 32, 45])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.LRNParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LRNParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"LRNParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LRNParameter.local_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LRNParameter\"], baseName' = FName \"local_size\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"5\", hsDefault = Just (HsDef'Integer 5)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LRNParameter.alpha\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LRNParameter\"], baseName' = FName \"alpha\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LRNParameter.beta\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LRNParameter\"], baseName' = FName \"beta\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 29}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"0.75\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (3 % 4)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LRNParameter.norm_region\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LRNParameter\"], baseName' = FName \"norm_region\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.LRNParameter.NormRegion\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"LRNParameter\"], baseName = MName \"NormRegion\"}), hsRawDefault = Just \"ACROSS_CHANNELS\", hsDefault = Just (HsDef'Enum \"ACROSS_CHANNELS\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LRNParameter.k\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LRNParameter\"], baseName' = FName \"k\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 45}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (1 % 1)))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"