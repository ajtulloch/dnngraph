{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.ReshapeParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.BlobShape as Caffe (BlobShape)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data ReshapeParameter = ReshapeParameter{shape :: !(P'.Maybe Caffe.BlobShape), axis :: !(P'.Maybe P'.Int32),
                                         num_axes :: !(P'.Maybe P'.Int32)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''ReshapeParameter

 
instance P'.Mergeable ReshapeParameter where
  mergeAppend (ReshapeParameter x'1 x'2 x'3) (ReshapeParameter y'1 y'2 y'3)
   = ReshapeParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3)
 
instance P'.Default ReshapeParameter where
  defaultValue = ReshapeParameter P'.defaultValue (Prelude'.Just 0) (Prelude'.Just (-1))
 
instance P'.Wire ReshapeParameter where
  wireSize ft' self'@(ReshapeParameter x'1 x'2 x'3)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 11 x'1 + P'.wireSizeOpt 1 5 x'2 + P'.wireSizeOpt 1 5 x'3)
  wirePut ft' self'@(ReshapeParameter x'1 x'2 x'3)
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
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{shape = P'.mergeAppend (shape old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{axis = Prelude'.Just new'Field}) (P'.wireGet 5)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{num_axes = Prelude'.Just new'Field}) (P'.wireGet 5)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> ReshapeParameter) ReshapeParameter where
  getVal m' f' = f' m'
 
instance P'.GPB ReshapeParameter
 
instance P'.ReflectDescriptor ReshapeParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 16, 24])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.ReshapeParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ReshapeParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"ReshapeParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ReshapeParameter.shape\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ReshapeParameter\"], baseName' = FName \"shape\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.BlobShape\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobShape\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ReshapeParameter.axis\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ReshapeParameter\"], baseName' = FName \"axis\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.ReshapeParameter.num_axes\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"ReshapeParameter\"], baseName' = FName \"num_axes\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"-1\", hsDefault = Just (HsDef'Integer (-1))}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"