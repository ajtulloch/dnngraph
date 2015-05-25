{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SliceParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data SliceParameter = SliceParameter{axis :: !(P'.Maybe P'.Int32), slice_point :: !(P'.Seq P'.Word32),
                                     slice_dim :: !(P'.Maybe P'.Word32)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''SliceParameter

 
instance P'.Mergeable SliceParameter where
  mergeAppend (SliceParameter x'1 x'2 x'3) (SliceParameter y'1 y'2 y'3)
   = SliceParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default SliceParameter where
  defaultValue = SliceParameter (Prelude'.Just 1) P'.defaultValue (Prelude'.Just 1)
 
instance P'.Wire SliceParameter where
  wireSize ft' self'@(SliceParameter x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeRep 1 13 x'2 + P'.wireSizeOpt 1 13 x'3)
  wirePut ft' self'@(SliceParameter x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 13 x'3
             P'.wirePutRep 16 13 x'2
             P'.wirePutOpt 24 5 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{axis = Prelude'.Just new'Field}) (P'.wireGet 5)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{slice_point = P'.append (slice_point old'Self) new'Field})
                    (P'.wireGet 13)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{slice_point = P'.mergeAppend (slice_point old'Self) new'Field})
                    (P'.wireGetPacked 13)
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{slice_dim = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> SliceParameter) SliceParameter where
  getVal m' f' = f' m'
 
instance P'.GPB SliceParameter
 
instance P'.ReflectDescriptor SliceParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 18, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.SliceParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SliceParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"SliceParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SliceParameter.axis\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SliceParameter\"], baseName' = FName \"axis\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SliceParameter.slice_point\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SliceParameter\"], baseName' = FName \"slice_point\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Just (WireTag {getWireTag = 16},WireTag {getWireTag = 18}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SliceParameter.slice_dim\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SliceParameter\"], baseName' = FName \"slice_dim\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"