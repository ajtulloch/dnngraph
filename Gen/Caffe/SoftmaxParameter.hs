{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SoftmaxParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.SoftmaxParameter.Engine as Caffe.SoftmaxParameter (Engine)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data SoftmaxParameter = SoftmaxParameter{engine :: !(P'.Maybe Caffe.SoftmaxParameter.Engine), axis :: !(P'.Maybe P'.Int32)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''SoftmaxParameter

 
instance P'.Mergeable SoftmaxParameter where
  mergeAppend (SoftmaxParameter x'1 x'2) (SoftmaxParameter y'1 y'2)
   = SoftmaxParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default SoftmaxParameter where
  defaultValue = SoftmaxParameter (Prelude'.Just (Prelude'.read "DEFAULT")) (Prelude'.Just 1)
 
instance P'.Wire SoftmaxParameter where
  wireSize ft' self'@(SoftmaxParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 14 x'1 + P'.wireSizeOpt 1 5 x'2)
  wirePut ft' self'@(SoftmaxParameter x'1 x'2)
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
             P'.wirePutOpt 16 5 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{engine = Prelude'.Just new'Field}) (P'.wireGet 14)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{axis = Prelude'.Just new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> SoftmaxParameter) SoftmaxParameter where
  getVal m' f' = f' m'
 
instance P'.GPB SoftmaxParameter
 
instance P'.ReflectDescriptor SoftmaxParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 16])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.SoftmaxParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SoftmaxParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"SoftmaxParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SoftmaxParameter.engine\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SoftmaxParameter\"], baseName' = FName \"engine\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SoftmaxParameter.Engine\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"SoftmaxParameter\"], baseName = MName \"Engine\"}), hsRawDefault = Just \"DEFAULT\", hsDefault = Just (HsDef'Enum \"DEFAULT\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SoftmaxParameter.axis\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SoftmaxParameter\"], baseName' = FName \"axis\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"