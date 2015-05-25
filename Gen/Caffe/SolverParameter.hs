{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SolverParameter  where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.NetParameter as Caffe (NetParameter)
import qualified Gen.Caffe.NetState as Caffe (NetState)
import qualified Gen.Caffe.SolverParameter.SolverMode as Caffe.SolverParameter (SolverMode)
import qualified Gen.Caffe.SolverParameter.SolverType as Caffe.SolverParameter (SolverType)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data SolverParameter = SolverParameter{net :: !(P'.Maybe P'.Utf8), net_param :: !(P'.Maybe Caffe.NetParameter),
                                       train_net :: !(P'.Maybe P'.Utf8), test_net :: !(P'.Seq P'.Utf8),
                                       train_net_param :: !(P'.Maybe Caffe.NetParameter),
                                       test_net_param :: !(P'.Seq Caffe.NetParameter), train_state :: !(P'.Maybe Caffe.NetState),
                                       test_state :: !(P'.Seq Caffe.NetState), test_iter :: !(P'.Seq P'.Int32),
                                       test_interval :: !(P'.Maybe P'.Int32), test_compute_loss :: !(P'.Maybe P'.Bool),
                                       test_initialization :: !(P'.Maybe P'.Bool), base_lr :: !(P'.Maybe P'.Float),
                                       display :: !(P'.Maybe P'.Int32), average_loss :: !(P'.Maybe P'.Int32),
                                       max_iter :: !(P'.Maybe P'.Int32), lr_policy :: !(P'.Maybe P'.Utf8),
                                       gamma :: !(P'.Maybe P'.Float), power :: !(P'.Maybe P'.Float),
                                       momentum :: !(P'.Maybe P'.Float), weight_decay :: !(P'.Maybe P'.Float),
                                       regularization_type :: !(P'.Maybe P'.Utf8), stepsize :: !(P'.Maybe P'.Int32),
                                       stepvalue :: !(P'.Seq P'.Int32), clip_gradients :: !(P'.Maybe P'.Float),
                                       snapshot :: !(P'.Maybe P'.Int32), snapshot_prefix :: !(P'.Maybe P'.Utf8),
                                       snapshot_diff :: !(P'.Maybe P'.Bool),
                                       solver_mode :: !(P'.Maybe Caffe.SolverParameter.SolverMode),
                                       device_id :: !(P'.Maybe P'.Int32), random_seed :: !(P'.Maybe P'.Int64),
                                       solver_type :: !(P'.Maybe Caffe.SolverParameter.SolverType), delta :: !(P'.Maybe P'.Float),
                                       debug_info :: !(P'.Maybe P'.Bool), snapshot_after_train :: !(P'.Maybe P'.Bool)}
                     deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''SolverParameter

 
instance P'.Mergeable SolverParameter where
  mergeAppend
   (SolverParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
     x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35)
   (SolverParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24
     y'25 y'26 y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35)
   = SolverParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
      (P'.mergeAppend x'10 y'10)
      (P'.mergeAppend x'11 y'11)
      (P'.mergeAppend x'12 y'12)
      (P'.mergeAppend x'13 y'13)
      (P'.mergeAppend x'14 y'14)
      (P'.mergeAppend x'15 y'15)
      (P'.mergeAppend x'16 y'16)
      (P'.mergeAppend x'17 y'17)
      (P'.mergeAppend x'18 y'18)
      (P'.mergeAppend x'19 y'19)
      (P'.mergeAppend x'20 y'20)
      (P'.mergeAppend x'21 y'21)
      (P'.mergeAppend x'22 y'22)
      (P'.mergeAppend x'23 y'23)
      (P'.mergeAppend x'24 y'24)
      (P'.mergeAppend x'25 y'25)
      (P'.mergeAppend x'26 y'26)
      (P'.mergeAppend x'27 y'27)
      (P'.mergeAppend x'28 y'28)
      (P'.mergeAppend x'29 y'29)
      (P'.mergeAppend x'30 y'30)
      (P'.mergeAppend x'31 y'31)
      (P'.mergeAppend x'32 y'32)
      (P'.mergeAppend x'33 y'33)
      (P'.mergeAppend x'34 y'34)
      (P'.mergeAppend x'35 y'35)
 
instance P'.Default SolverParameter where
  defaultValue
   = SolverParameter P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just 0)
      (Prelude'.Just Prelude'.False)
      (Prelude'.Just Prelude'.True)
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just 1)
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just (P'.Utf8 (P'.pack "L2")))
      P'.defaultValue
      P'.defaultValue
      (Prelude'.Just (-1.0))
      (Prelude'.Just 0)
      P'.defaultValue
      (Prelude'.Just Prelude'.False)
      (Prelude'.Just (Prelude'.read "GPU"))
      (Prelude'.Just 0)
      (Prelude'.Just (-1))
      (Prelude'.Just (Prelude'.read "SGD"))
      (Prelude'.Just 9.99999993922529e-9)
      (Prelude'.Just Prelude'.False)
      (Prelude'.Just Prelude'.True)
 
instance P'.Wire SolverParameter where
  wireSize ft'
   self'@(SolverParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 2 9 x'1 + P'.wireSizeOpt 2 11 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeRep 1 9 x'4 +
             P'.wireSizeOpt 2 11 x'5
             + P'.wireSizeRep 2 11 x'6
             + P'.wireSizeOpt 2 11 x'7
             + P'.wireSizeRep 2 11 x'8
             + P'.wireSizeRep 1 5 x'9
             + P'.wireSizeOpt 1 5 x'10
             + P'.wireSizeOpt 2 8 x'11
             + P'.wireSizeOpt 2 8 x'12
             + P'.wireSizeOpt 1 2 x'13
             + P'.wireSizeOpt 1 5 x'14
             + P'.wireSizeOpt 2 5 x'15
             + P'.wireSizeOpt 1 5 x'16
             + P'.wireSizeOpt 1 9 x'17
             + P'.wireSizeOpt 1 2 x'18
             + P'.wireSizeOpt 1 2 x'19
             + P'.wireSizeOpt 1 2 x'20
             + P'.wireSizeOpt 1 2 x'21
             + P'.wireSizeOpt 2 9 x'22
             + P'.wireSizeOpt 1 5 x'23
             + P'.wireSizeRep 2 5 x'24
             + P'.wireSizeOpt 2 2 x'25
             + P'.wireSizeOpt 1 5 x'26
             + P'.wireSizeOpt 1 9 x'27
             + P'.wireSizeOpt 2 8 x'28
             + P'.wireSizeOpt 2 14 x'29
             + P'.wireSizeOpt 2 5 x'30
             + P'.wireSizeOpt 2 3 x'31
             + P'.wireSizeOpt 2 14 x'32
             + P'.wireSizeOpt 2 2 x'33
             + P'.wireSizeOpt 2 8 x'34
             + P'.wireSizeOpt 2 8 x'35)
  wirePut ft'
   self'@(SolverParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'3
             P'.wirePutRep 18 9 x'4
             P'.wirePutRep 24 5 x'9
             P'.wirePutOpt 32 5 x'10
             P'.wirePutOpt 45 2 x'13
             P'.wirePutOpt 48 5 x'14
             P'.wirePutOpt 56 5 x'16
             P'.wirePutOpt 66 9 x'17
             P'.wirePutOpt 77 2 x'18
             P'.wirePutOpt 85 2 x'19
             P'.wirePutOpt 93 2 x'20
             P'.wirePutOpt 101 2 x'21
             P'.wirePutOpt 104 5 x'23
             P'.wirePutOpt 112 5 x'26
             P'.wirePutOpt 122 9 x'27
             P'.wirePutOpt 128 8 x'28
             P'.wirePutOpt 136 14 x'29
             P'.wirePutOpt 144 5 x'30
             P'.wirePutOpt 152 8 x'11
             P'.wirePutOpt 160 3 x'31
             P'.wirePutOpt 170 11 x'5
             P'.wirePutRep 178 11 x'6
             P'.wirePutOpt 184 8 x'34
             P'.wirePutOpt 194 9 x'1
             P'.wirePutOpt 202 11 x'2
             P'.wirePutOpt 210 11 x'7
             P'.wirePutRep 218 11 x'8
             P'.wirePutOpt 224 8 x'35
             P'.wirePutOpt 234 9 x'22
             P'.wirePutOpt 240 14 x'32
             P'.wirePutOpt 253 2 x'33
             P'.wirePutOpt 256 8 x'12
             P'.wirePutOpt 264 5 x'15
             P'.wirePutRep 272 5 x'24
             P'.wirePutOpt 285 2 x'25
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             194 -> Prelude'.fmap (\ !new'Field -> old'Self{net = Prelude'.Just new'Field}) (P'.wireGet 9)
             202 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{net_param = P'.mergeAppend (net_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{train_net = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{test_net = P'.append (test_net old'Self) new'Field}) (P'.wireGet 9)
             170 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{train_net_param = P'.mergeAppend (train_net_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             178 -> Prelude'.fmap (\ !new'Field -> old'Self{test_net_param = P'.append (test_net_param old'Self) new'Field})
                     (P'.wireGet 11)
             210 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{train_state = P'.mergeAppend (train_state old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             218 -> Prelude'.fmap (\ !new'Field -> old'Self{test_state = P'.append (test_state old'Self) new'Field}) (P'.wireGet 11)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{test_iter = P'.append (test_iter old'Self) new'Field}) (P'.wireGet 5)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{test_iter = P'.mergeAppend (test_iter old'Self) new'Field})
                    (P'.wireGetPacked 5)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{test_interval = Prelude'.Just new'Field}) (P'.wireGet 5)
             152 -> Prelude'.fmap (\ !new'Field -> old'Self{test_compute_loss = Prelude'.Just new'Field}) (P'.wireGet 8)
             256 -> Prelude'.fmap (\ !new'Field -> old'Self{test_initialization = Prelude'.Just new'Field}) (P'.wireGet 8)
             45 -> Prelude'.fmap (\ !new'Field -> old'Self{base_lr = Prelude'.Just new'Field}) (P'.wireGet 2)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{display = Prelude'.Just new'Field}) (P'.wireGet 5)
             264 -> Prelude'.fmap (\ !new'Field -> old'Self{average_loss = Prelude'.Just new'Field}) (P'.wireGet 5)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{max_iter = Prelude'.Just new'Field}) (P'.wireGet 5)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{lr_policy = Prelude'.Just new'Field}) (P'.wireGet 9)
             77 -> Prelude'.fmap (\ !new'Field -> old'Self{gamma = Prelude'.Just new'Field}) (P'.wireGet 2)
             85 -> Prelude'.fmap (\ !new'Field -> old'Self{power = Prelude'.Just new'Field}) (P'.wireGet 2)
             93 -> Prelude'.fmap (\ !new'Field -> old'Self{momentum = Prelude'.Just new'Field}) (P'.wireGet 2)
             101 -> Prelude'.fmap (\ !new'Field -> old'Self{weight_decay = Prelude'.Just new'Field}) (P'.wireGet 2)
             234 -> Prelude'.fmap (\ !new'Field -> old'Self{regularization_type = Prelude'.Just new'Field}) (P'.wireGet 9)
             104 -> Prelude'.fmap (\ !new'Field -> old'Self{stepsize = Prelude'.Just new'Field}) (P'.wireGet 5)
             272 -> Prelude'.fmap (\ !new'Field -> old'Self{stepvalue = P'.append (stepvalue old'Self) new'Field}) (P'.wireGet 5)
             274 -> Prelude'.fmap (\ !new'Field -> old'Self{stepvalue = P'.mergeAppend (stepvalue old'Self) new'Field})
                     (P'.wireGetPacked 5)
             285 -> Prelude'.fmap (\ !new'Field -> old'Self{clip_gradients = Prelude'.Just new'Field}) (P'.wireGet 2)
             112 -> Prelude'.fmap (\ !new'Field -> old'Self{snapshot = Prelude'.Just new'Field}) (P'.wireGet 5)
             122 -> Prelude'.fmap (\ !new'Field -> old'Self{snapshot_prefix = Prelude'.Just new'Field}) (P'.wireGet 9)
             128 -> Prelude'.fmap (\ !new'Field -> old'Self{snapshot_diff = Prelude'.Just new'Field}) (P'.wireGet 8)
             136 -> Prelude'.fmap (\ !new'Field -> old'Self{solver_mode = Prelude'.Just new'Field}) (P'.wireGet 14)
             144 -> Prelude'.fmap (\ !new'Field -> old'Self{device_id = Prelude'.Just new'Field}) (P'.wireGet 5)
             160 -> Prelude'.fmap (\ !new'Field -> old'Self{random_seed = Prelude'.Just new'Field}) (P'.wireGet 3)
             240 -> Prelude'.fmap (\ !new'Field -> old'Self{solver_type = Prelude'.Just new'Field}) (P'.wireGet 14)
             253 -> Prelude'.fmap (\ !new'Field -> old'Self{delta = Prelude'.Just new'Field}) (P'.wireGet 2)
             184 -> Prelude'.fmap (\ !new'Field -> old'Self{debug_info = Prelude'.Just new'Field}) (P'.wireGet 8)
             224 -> Prelude'.fmap (\ !new'Field -> old'Self{snapshot_after_train = Prelude'.Just new'Field}) (P'.wireGet 8)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> SolverParameter) SolverParameter where
  getVal m' f' = f' m'
 
instance P'.GPB SolverParameter
 
instance P'.ReflectDescriptor SolverParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList
        [10, 18, 24, 26, 32, 45, 48, 56, 66, 77, 85, 93, 101, 104, 112, 122, 128, 136, 144, 152, 160, 170, 178, 184, 194, 202, 210,
         218, 224, 234, 240, 253, 256, 264, 272, 274, 285])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.SolverParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SolverParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"SolverParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.net\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"net\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 194}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.net_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"net_param\"}, fieldNumber = FieldId {getFieldId = 25}, wireTag = WireTag {getWireTag = 202}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.train_net\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"train_net\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.test_net\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"test_net\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.train_net_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"train_net_param\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 170}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.test_net_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"test_net_param\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 178}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.train_state\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"train_state\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 210}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetState\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.test_state\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"test_state\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 218}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetState\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.test_iter\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"test_iter\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Just (WireTag {getWireTag = 24},WireTag {getWireTag = 26}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.test_interval\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"test_interval\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.test_compute_loss\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"test_compute_loss\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 152}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.test_initialization\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"test_initialization\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 256}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.base_lr\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"base_lr\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 45}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.display\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"display\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.average_loss\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"average_loss\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 264}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"1\", hsDefault = Just (HsDef'Integer 1)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.max_iter\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"max_iter\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.lr_policy\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"lr_policy\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.gamma\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"gamma\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 77}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.power\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"power\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 85}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.momentum\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"momentum\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 93}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.weight_decay\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"weight_decay\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 101}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.regularization_type\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"regularization_type\"}, fieldNumber = FieldId {getFieldId = 29}, wireTag = WireTag {getWireTag = 234}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Just \"L2\", hsDefault = Just (HsDef'ByteString \"L2\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.stepsize\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"stepsize\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.stepvalue\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"stepvalue\"}, fieldNumber = FieldId {getFieldId = 34}, wireTag = WireTag {getWireTag = 272}, packedTag = Just (WireTag {getWireTag = 272},WireTag {getWireTag = 274}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.clip_gradients\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"clip_gradients\"}, fieldNumber = FieldId {getFieldId = 35}, wireTag = WireTag {getWireTag = 285}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"-1.0\", hsDefault = Just (HsDef'RealFloat (SRF'Rational ((-1) % 1)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.snapshot\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"snapshot\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 112}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.snapshot_prefix\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"snapshot_prefix\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.snapshot_diff\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"snapshot_diff\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 128}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.solver_mode\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"solver_mode\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 136}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SolverParameter.SolverMode\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"SolverParameter\"], baseName = MName \"SolverMode\"}), hsRawDefault = Just \"GPU\", hsDefault = Just (HsDef'Enum \"GPU\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.device_id\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"device_id\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 144}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Just \"0\", hsDefault = Just (HsDef'Integer 0)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.random_seed\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"random_seed\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 160}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Just \"-1\", hsDefault = Just (HsDef'Integer (-1))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.solver_type\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"solver_type\"}, fieldNumber = FieldId {getFieldId = 30}, wireTag = WireTag {getWireTag = 240}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SolverParameter.SolverType\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"SolverParameter\"], baseName = MName \"SolverType\"}), hsRawDefault = Just \"SGD\", hsDefault = Just (HsDef'Enum \"SGD\")},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.delta\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"delta\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 253}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Just \"1.0e-8\", hsDefault = Just (HsDef'RealFloat (SRF'Rational (11258999 % 1125899906842624)))},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.debug_info\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"debug_info\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 184}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.SolverParameter.snapshot_after_train\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"SolverParameter\"], baseName' = FName \"snapshot_after_train\"}, fieldNumber = FieldId {getFieldId = 28}, wireTag = WireTag {getWireTag = 224}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"true\", hsDefault = Just (HsDef'Bool True)}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"