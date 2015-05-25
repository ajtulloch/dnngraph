{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.ConvolutionParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.ConvolutionParameter.Engine as Caffe.ConvolutionParameter (Engine)
import qualified Gen.Caffe.FillerParameter as Caffe (FillerParameter)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data ConvolutionParameter = ConvolutionParameter{num_input :: !(P'.Maybe P'.Word32), num_output :: !(P'.Maybe P'.Word32),
                                                 bias_term :: !(P'.Maybe P'.Bool), pad :: !(P'.Maybe P'.Word32),
                                                 pad_h :: !(P'.Maybe P'.Word32), pad_w :: !(P'.Maybe P'.Word32),
                                                 kernel_size :: !(P'.Maybe P'.Word32), kernel_h :: !(P'.Maybe P'.Word32),
                                                 kernel_w :: !(P'.Maybe P'.Word32), group :: !(P'.Maybe P'.Word32),
                                                 stride :: !(P'.Maybe P'.Word32), stride_h :: !(P'.Maybe P'.Word32),
                                                 stride_w :: !(P'.Maybe P'.Word32),
                                                 weight_filler :: !(P'.Maybe Caffe.FillerParameter),
                                                 bias_filler :: !(P'.Maybe Caffe.FillerParameter),
                                                 engine :: !(P'.Maybe Caffe.ConvolutionParameter.Engine)}
                          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''ConvolutionParameter

 
instance P'.Mergeable ConvolutionParameter where
  mergeAppend (ConvolutionParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   (ConvolutionParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16)
   = ConvolutionParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
 
instance P'.Default ConvolutionParameter where
  defaultValue
   = ConvolutionParameter P'.defaultValue P'.defaultValue (Prelude'.Just Prelude'.True) (Prelude'.Just 0) (Prelude'.Just 0)
      (Prelude'.Just 0)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just 1)
      (Prelude'.Just 1)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just (Prelude'.read "DEFAULT"))
 
instance P'.Wire ConvolutionParameter where
  wireSize ft' self'@(ConvolutionParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 2 13 x'1 + P'.wireSizeOpt 1 13 x'2 + P'.wireSizeOpt 1 8 x'3 + P'.wireSizeOpt 1 13 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeOpt 1 13 x'9
             + P'.wireSizeOpt 1 13 x'10
             + P'.wireSizeOpt 1 13 x'11
             + P'.wireSizeOpt 1 13 x'12
             + P'.wireSizeOpt 1 13 x'13
             + P'.wireSizeOpt 1 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeOpt 1 14 x'16)
  wirePut ft' self'@(ConvolutionParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 13 x'2
             P'.wirePutOpt 16 8 x'3
             P'.wirePutOpt 24 13 x'4
             P'.wirePutOpt 32 13 x'7
             P'.wirePutOpt 40 13 x'10
             P'.wirePutOpt 48 13 x'11
             P'.wirePutOpt 58 11 x'14
             P'.wirePutOpt 66 11 x'15
             P'.wirePutOpt 72 13 x'5
             P'.wirePutOpt 80 13 x'6
             P'.wirePutOpt 88 13 x'8
             P'.wirePutOpt 96 13 x'9
             P'.wirePutOpt 104 13 x'12
             P'.wirePutOpt 112 13 x'13
             P'.wirePutOpt 120 14 x'16
             P'.wirePutOpt 800 13 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             800 -> Prelude'.fmap (\ !new'Field -> old'Self{num_input = Prelude'.Just new'Field}) (P'.wireGet 13)
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{num_output = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{bias_term = Prelude'.Just new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{pad = Prelude'.Just new'Field}) (P'.wireGet 13)
             72 -> Prelude'.fmap (\ !new'Field -> old'Self{pad_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{pad_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{kernel_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{kernel_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             96 -> Prelude'.fmap (\ !new'Field -> old'Self{kernel_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{group = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{stride = Prelude'.Just new'Field}) (P'.wireGet 13)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{stride_h = Prelude'.Just new'Field}) (P'.wireGet 13)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{stride_w = Prelude'.Just new'Field}) (P'.wireGet 13)
             58 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{weight_filler = P'.mergeAppend (weight_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             66 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{bias_filler = P'.mergeAppend (bias_filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             120 -> Prelude'.fmap (\ !new'Field -> old'Self{engine = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> ConvolutionParameter) ConvolutionParameter where
  getVal m' f' = f' m'
 
instance P'.GPB ConvolutionParameter
 
instance P'.ReflectDescriptor ConvolutionParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 58, 66, 72, 80, 88, 96, 104, 112, 120, 800])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ConvolutionParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ConvolutionParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ConvolutionParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.num_input\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"num_input\"}, fieldNumber = FieldId {getFieldId = 100}, wireTag = WireTag {getWireTag = 800}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.num_output\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"num_output\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.bias_term\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"bias_term\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.pad\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"pad\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.pad_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"pad_h\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 72}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.pad_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"pad_w\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.kernel_size\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"kernel_size\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.kernel_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"kernel_h\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.kernel_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"kernel_w\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 96}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.group\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"group\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.stride\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"stride\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.stride_h\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"stride_h\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.stride_w\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"stride_w\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.weight_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"weight_filler\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.bias_filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"bias_filler\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ConvolutionParameter.engine\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName' = FName \"engine\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 120}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ConvolutionParameter.Engine\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"ConvolutionParameter\"], baseName = MName \"Engine\"}), hsRawDefault = Just \"DEFAULT\", hsDefault = Just (HsDef'Enum \"DEFAULT\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"