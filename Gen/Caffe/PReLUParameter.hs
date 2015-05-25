{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.PReLUParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.FillerParameter as Caffe (FillerParameter)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data PReLUParameter = PReLUParameter{filler :: !(P'.Maybe Caffe.FillerParameter), channel_shared :: !(P'.Maybe P'.Bool)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''PReLUParameter

 
instance P'.Mergeable PReLUParameter where
  mergeAppend (PReLUParameter x'1 x'2) (PReLUParameter y'1 y'2) = PReLUParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default PReLUParameter where
  defaultValue = PReLUParameter P'.defaultValue (Prelude'.Just Prelude'.False)
 
instance P'.Wire PReLUParameter where
  wireSize ft' self'@(PReLUParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 8 x'2)
  wirePut ft' self'@(PReLUParameter x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 11 x'1
             P'.wirePutOpt 16 8 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{filler = P'.mergeAppend (filler old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{channel_shared = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> PReLUParameter) PReLUParameter where
  getVal m' f' = f' m'
 
instance P'.GPB PReLUParameter
 
instance P'.ReflectDescriptor PReLUParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.PReLUParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PReLUParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"PReLUParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PReLUParameter.filler\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PReLUParameter\"], baseName' = FName \"filler\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.FillerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"FillerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PReLUParameter.channel_shared\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PReLUParameter\"], baseName' = FName \"channel_shared\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"