{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.PoolingParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.PoolingParameter.Engine as Caffe.PoolingParameter (Engine)
import qualified Gen.Caffe.PoolingParameter.PoolMethod as Caffe.PoolingParameter (PoolMethod)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data PoolingParameter = PoolingParameter{pool :: !(P'.Maybe Caffe.PoolingParameter.PoolMethod), pad :: !(P'.Maybe P'.Word32),
                                         pad_h :: !(P'.Maybe P'.Word32), pad_w :: !(P'.Maybe P'.Word32),
                                         kernel_size :: !(P'.Maybe P'.Word32), kernel_h :: !(P'.Maybe P'.Word32),
                                         kernel_w :: !(P'.Maybe P'.Word32), stride :: !(P'.Maybe P'.Word32),
                                         stride_h :: !(P'.Maybe P'.Word32), stride_w :: !(P'.Maybe P'.Word32),
                                         engine :: !(P'.Maybe Caffe.PoolingParameter.Engine), global_pooling :: !(P'.Maybe P'.Bool)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''PoolingParameter

 
instance P'.Mergeable PoolingParameter where
  mergeAppend (PoolingParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   (PoolingParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12)
   = PoolingParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
 
instance P'.Default PoolingParameter where
  defaultValue
   = PoolingParameter (Prelude'.Just (Prelude'.read "MAX")) (Prelude'.Just 0) (Prelude'.Just 0) (Prelude'.Just 0) P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just 1)
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just (Prelude'.read "DEFAULT"))
      (Prelude'.Just Prelude'.False)
 
instance P'.Wire PoolingParameter where
  wireSize ft' self'@(PoolingParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 13 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 13 x'9
             + P'.wireSizeOpt 1 13 x'10
             + P'.wireSizeOpt 1 14 x'11
             + P'.wireSizeOpt 1 8 x'12)
  wirePut ft' self'@(PoolingParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 14 x'1
             P'.wirePutOpt 16 13 x'5
             P'.wirePutOpt 24 13 x'8
             P'.wirePutOpt 32 13 x'2
             P'.wirePutOpt 40 13 x'6
             P'.wirePutOpt 48 13 x'7
             P'.wirePutOpt 56 13 x'9
             P'.wirePutOpt 64 13 x'10
             P'.wirePutOpt 72 13 x'3
             P'.wirePutOpt 80 13 x'4
             P'.wirePutOpt 88 14 x'11
             P'.wirePutOpt 96 8 x'12
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{pool = Prelude'.Just new'Field}) (P'.wireGet 14)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{pad = Prelude'.Just new'Field}) (P'.wireGet 13)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{pad_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{pad_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{kernel_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{kernel_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{kernel_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{stride = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{stride_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{stride_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{engine = Prelude'.Just new'Field}) (P'.wireGet 14)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{global_pooling = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> PoolingParameter) PoolingParameter where
  getVal m' f' = f' m'
 
instance P'.GPB PoolingParameter
 
instance P'.ReflectDescriptor PoolingParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.PoolingParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PoolingParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"PoolingParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.pool\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"pool\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PoolingParameter.PoolMethod\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"PoolingParameter\"], baseName = MName \"PoolMethod\"}), hsRawDefault = Just \"MAX\", hsDefault = Just (HsDef'Enum \"MAX\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.pad\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"pad\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.pad_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"pad_h\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.pad_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"pad_w\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.kernel_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"kernel_size\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.kernel_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"kernel_h\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.kernel_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"kernel_w\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.stride\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"stride\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.stride_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"stride_h\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.stride_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"stride_w\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.engine\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"engine\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PoolingParameter.Engine\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"PoolingParameter\"], baseName = MName \"Engine\"}), hsRawDefault = Just \"DEFAULT\", hsDefault = Just (HsDef'Enum \"DEFAULT\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PoolingParameter.global_pooling\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PoolingParameter\"], baseName' = FName \"global_pooling\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"