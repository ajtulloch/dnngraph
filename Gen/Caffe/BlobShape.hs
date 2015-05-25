{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.BlobShape  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data BlobShape = BlobShape{dim :: !(P'.Seq P'.Int64)}
               deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''BlobShape

 
instance P'.Mergeable BlobShape where
  mergeAppend (BlobShape x'1) (BlobShape y'1) = BlobShape (P'.mergeAppend x'1 y'1)
 
instance P'.Default BlobShape where
  defaultValue = BlobShape P'.defaultValue
 
instance P'.Wire BlobShape where
  wireSize ft' self'@(BlobShape x'1)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizePacked 1 3 x'1)
  wirePut ft' self'@(BlobShape x'1)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutPacked 10 3 x'1
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{dim = P'.append (dim old'Self) new'Field}) (P'.wireGet 3)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{dim = P'.mergeAppend (dim old'Self) new'Field}) (P'.wireGetPacked 3)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> BlobShape) BlobShape where
  getVal m' f' = f' m'
 
instance P'.GPB BlobShape
 
instance P'.ReflectDescriptor BlobShape where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 10])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.BlobShape\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobShape\"}, descFilePath = [\"Gen\",\"Caffe\",\"BlobShape.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.BlobShape.dim\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"BlobShape\"], baseName' = FName \"dim\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Just (WireTag {getWireTag = 8},WireTag {getWireTag = 10}), wireTagLength = 1, isPacked = True, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"