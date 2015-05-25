{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.PurineNetParameter.Node  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.LayerParameter as Caffe (LayerParameter)
import qualified Gen.Caffe.PurineNetParameter.Direction as Caffe.PurineNetParameter (Direction)
import qualified Gen.Caffe.PurineNetParameter.Operation as Caffe.PurineNetParameter (Operation)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data Node = Node{nodeId :: !(P'.Maybe P'.Int32), layerParameter :: !(P'.Maybe Caffe.LayerParameter),
                 direction :: !(P'.Maybe Caffe.PurineNetParameter.Direction),
                 operation :: !(P'.Maybe Caffe.PurineNetParameter.Operation)}
          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''Node

 
instance P'.Mergeable Node where
  mergeAppend (Node x'1 x'2 x'3 x'4) (Node y'1 y'2 y'3 y'4)
   = Node (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
 
instance P'.Default Node where
  defaultValue = Node P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
 
instance P'.Wire Node where
  wireSize ft' self'@(Node x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 5 x'1 + P'.wireSizeOpt 1 11 x'2 + P'.wireSizeOpt 1 14 x'3 + P'.wireSizeOpt 1 14 x'4)
  wirePut ft' self'@(Node x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 8 5 x'1
             P'.wirePutOpt 18 11 x'2
             P'.wirePutOpt 24 14 x'3
             P'.wirePutOpt 32 14 x'4
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{nodeId = Prelude'.Just new'Field}) (P'.wireGet 5)
             18 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{layerParameter = P'.mergeAppend (layerParameter old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{direction = Prelude'.Just new'Field}) (P'.wireGet 14)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{operation = Prelude'.Just new'Field}) (P'.wireGet 14)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Node) Node where
  getVal m' f' = f' m'
 
instance P'.GPB Node
 
instance P'.ReflectDescriptor Node where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 18, 24, 32])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.PurineNetParameter.Node\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"PurineNetParameter\"], baseName = MName \"Node\"}, descFilePath = [\"Gen\",\"Caffe\",\"PurineNetParameter\",\"Node.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PurineNetParameter.Node.nodeId\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PurineNetParameter\",MName \"Node\"], baseName' = FName \"nodeId\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PurineNetParameter.Node.layerParameter\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PurineNetParameter\",MName \"Node\"], baseName' = FName \"layerParameter\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.LayerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LayerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PurineNetParameter.Node.direction\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PurineNetParameter\",MName \"Node\"], baseName' = FName \"direction\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PurineNetParameter.Direction\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"PurineNetParameter\"], baseName = MName \"Direction\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PurineNetParameter.Node.operation\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PurineNetParameter\",MName \"Node\"], baseName' = FName \"operation\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PurineNetParameter.Operation\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"PurineNetParameter\"], baseName = MName \"Operation\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"