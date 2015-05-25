{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.MVNParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data MVNParameter = MVNParameter{normalize_variance :: !(P'.Maybe P'.Bool), across_channels :: !(P'.Maybe P'.Bool),
                                 eps :: !(P'.Maybe P'.Float)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''MVNParameter

 
instance P'.Mergeable MVNParameter where
  mergeAppend (MVNParameter x'1 x'2 x'3) (MVNParameter y'1 y'2 y'3)
   = MVNParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default MVNParameter where
  defaultValue = MVNParameter (Prelude'.Just Prelude'.True) (Prelude'.Just Prelude'.False) (Prelude'.Just 9.999999717180685e-10)
 
instance P'.Wire MVNParameter where
  wireSize ft' self'@(MVNParameter x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeOpt 1 2 x'3)
  wirePut ft' self'@(MVNParameter x'1 x'2 x'3)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 8 x'1
             P'.wirePutOpt 16 8 x'2
             P'.wirePutOpt 29 2 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{normalize_variance = Prelude'.Just new'Field}) (P'.wireGet 8)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{across_channels = Prelude'.Just new'Field}) (P'.wireGet 8)
             29 -> Prelude'.fmap (\ !new'Field -> old'Self{eps = Prelude'.Just new'Field}) (P'.wireGet 2)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> MVNParameter) MVNParameter where
  getVal m' f' = f' m'
 
instance P'.GPB MVNParameter
 
instance P'.ReflectDescriptor MVNParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 29])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.MVNParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"MVNParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"MVNParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MVNParameter.normalize_variance\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MVNParameter\"], baseName' = FName \"normalize_variance\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MVNParameter.across_channels\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MVNParameter\"], baseName' = FName \"across_channels\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.MVNParameter.eps\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"MVNParameter\"], baseName' = FName \"eps\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 29}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0e-9\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (9007199 % 9007199254740992)))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"