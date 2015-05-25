{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SPPParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.SPPParameter.Engine as Caffe.SPPParameter (Engine)
import qualified Gen.Caffe.SPPParameter.PoolMethod as Caffe.SPPParameter (PoolMethod)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data SPPParameter = SPPParameter{pyramid_height :: !(P'.Maybe P'.Word32), pool :: !(P'.Maybe Caffe.SPPParameter.PoolMethod),
                                 engine :: !(P'.Maybe Caffe.SPPParameter.Engine)}
                  deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''SPPParameter

 
instance P'.Mergeable SPPParameter where
  mergeAppend (SPPParameter x'1 x'2 x'3) (SPPParameter y'1 y'2 y'3)
   = SPPParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default SPPParameter where
  defaultValue = SPPParameter P'.defaultValue (Prelude'.Just (Prelude'.read "MAX")) (Prelude'.Just (Prelude'.read "DEFAULT"))
 
instance P'.Wire SPPParameter where
  wireSize ft' self'@(SPPParameter x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 13 x'1 + P'.wireSizeOpt 1 14 x'2 + P'.wireSizeOpt 1 14 x'3)
  wirePut ft' self'@(SPPParameter x'1 x'2 x'3)
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
             P'.wirePutOpt 16 14 x'2
             P'.wirePutOpt 48 14 x'3
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{pyramid_height = Prelude'.Just new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{pool = Prelude'.Just new'Field}) (P'.wireGet 14)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{engine = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> SPPParameter) SPPParameter where
  getVal m' f' = f' m'
 
instance P'.GPB SPPParameter
 
instance P'.ReflectDescriptor SPPParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16, 48])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.SPPParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SPPParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"SPPParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SPPParameter.pyramid_height\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SPPParameter\"], baseName' = FName \"pyramid_height\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SPPParameter.pool\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SPPParameter\"], baseName' = FName \"pool\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SPPParameter.PoolMethod\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"SPPParameter\"], baseName = MName \"PoolMethod\"}), hsRawDefault = Just \"MAX\", hsDefault = Just (HsDef'Enum \"MAX\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SPPParameter.engine\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SPPParameter\"], baseName' = FName \"engine\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SPPParameter.Engine\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"SPPParameter\"], baseName = MName \"Engine\"}), hsRawDefault = Just \"DEFAULT\", hsDefault = Just (HsDef'Enum \"DEFAULT\")}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"