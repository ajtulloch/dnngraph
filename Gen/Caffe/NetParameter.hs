{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.NetParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.BlobShape as Caffe (BlobShape)
import qualified Gen.Caffe.LayerParameter as Caffe (LayerParameter)
import qualified Gen.Caffe.NetState as Caffe (NetState)
import qualified Gen.Caffe.V1LayerParameter as Caffe (V1LayerParameter)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data NetParameter = NetParameter{name :: !(P'.Maybe P'.Utf8), input :: !(P'.Seq P'.Utf8), input_shape :: !(P'.Seq Caffe.BlobShape),
                                 input_dim :: !(P'.Seq P'.Int32), force_backward :: !(P'.Maybe P'.Bool),
                                 state :: !(P'.Maybe Caffe.NetState), debug_info :: !(P'.Maybe P'.Bool),
                                 layer :: !(P'.Seq Caffe.LayerParameter), layers :: !(P'.Seq Caffe.V1LayerParameter)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''NetParameter

 
instance P'.Mergeable NetParameter where
  mergeAppend (NetParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (NetParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = NetParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
 
instance P'.Default NetParameter where
  defaultValue
   = NetParameter P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue (Prelude'.Just Prelude'.False) P'.defaultValue
      (Prelude'.Just Prelude'.False)
      P'.defaultValue
      P'.defaultValue
 
instance P'.Wire NetParameter where
  wireSize ft' self'@(NetParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeRep 1 9 x'2 + P'.wireSizeRep 1 11 x'3 + P'.wireSizeRep 1 5 x'4 +
             P'.wireSizeOpt 1 8 x'5
             + P'.wireSizeOpt 1 11 x'6
             + P'.wireSizeOpt 1 8 x'7
             + P'.wireSizeRep 2 11 x'8
             + P'.wireSizeRep 1 11 x'9)
  wirePut ft' self'@(NetParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
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
             P'.wirePutRep 18 11 x'9
             P'.wirePutRep 26 9 x'2
             P'.wirePutRep 32 5 x'4
             P'.wirePutOpt 40 8 x'5
             P'.wirePutOpt 50 11 x'6
             P'.wirePutOpt 56 8 x'7
             P'.wirePutRep 66 11 x'3
             P'.wirePutRep 802 11 x'8
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{name = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{input = P'.append (input old'Self) new'Field}) (P'.wireGet 9)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{input_shape = P'.append (input_shape old'Self) new'Field})
                    (P'.wireGet 11)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{input_dim = P'.append (input_dim old'Self) new'Field}) (P'.wireGet 5)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{input_dim = P'.mergeAppend (input_dim old'Self) new'Field})
                    (P'.wireGetPacked 5)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{force_backward = Prelude'.Just new'Field}) (P'.wireGet 8)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{state = P'.mergeAppend (state old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{debug_info = Prelude'.Just new'Field}) (P'.wireGet 8)
             802 -> Prelude'.fmap (\ !new'Field -> old'Self{layer = P'.append (layer old'Self) new'Field}) (P'.wireGet 11)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{layers = P'.append (layers old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> NetParameter) NetParameter where
  getVal m' f' = f' m'
 
instance P'.GPB NetParameter
 
instance P'.ReflectDescriptor NetParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18, 26, 32, 34, 40, 50, 56, 66, 802])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.NetParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"NetParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.name\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"name\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.input\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"input\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.input_shape\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"input_shape\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.BlobShape\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobShape\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.input_dim\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"input_dim\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Just (WireTag {getWireTag = 32},WireTag {getWireTag = 34}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.force_backward\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"force_backward\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.state\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"state\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetState\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.debug_info\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"debug_info\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.layer\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"layer\"}, fieldNumber = FieldId {getFieldId = 100}, wireTag = WireTag {getWireTag = 802}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.LayerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LayerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.NetParameter.layers\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"NetParameter\"], baseName' = FName \"layers\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.V1LayerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"V1LayerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"