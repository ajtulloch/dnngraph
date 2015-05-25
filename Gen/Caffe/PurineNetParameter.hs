{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.PurineNetParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.PurineNetParameter.Edge as Caffe.PurineNetParameter (Edge)
import qualified Gen.Caffe.PurineNetParameter.Node as Caffe.PurineNetParameter (Node)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data PurineNetParameter = PurineNetParameter{nodes :: !(P'.Seq Caffe.PurineNetParameter.Node),
                                             edges :: !(P'.Seq Caffe.PurineNetParameter.Edge)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''PurineNetParameter

 
instance P'.Mergeable PurineNetParameter where
  mergeAppend (PurineNetParameter x'1 x'2) (PurineNetParameter y'1 y'2)
   = PurineNetParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default PurineNetParameter where
  defaultValue = PurineNetParameter P'.defaultValue P'.defaultValue
 
instance P'.Wire PurineNetParameter where
  wireSize ft' self'@(PurineNetParameter x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeRep 1 11 x'2)
  wirePut ft' self'@(PurineNetParameter x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 18 11 x'1
             P'.wirePutRep 26 11 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{nodes = P'.append (nodes old'Self) new'Field}) (P'.wireGet 11)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{edges = P'.append (edges old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> PurineNetParameter) PurineNetParameter where
  getVal m' f' = f' m'
 
instance P'.GPB PurineNetParameter
 
instance P'.ReflectDescriptor PurineNetParameter where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [18, 26])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.PurineNetParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PurineNetParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"PurineNetParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PurineNetParameter.nodes\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PurineNetParameter\"], baseName' = FName \"nodes\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PurineNetParameter.Node\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"PurineNetParameter\"], baseName = MName \"Node\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.PurineNetParameter.edges\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"PurineNetParameter\"], baseName' = FName \"edges\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PurineNetParameter.Edge\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"PurineNetParameter\"], baseName = MName \"Edge\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"