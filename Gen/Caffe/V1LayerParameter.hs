{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.V1LayerParameter (V1LayerParameter(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Gen.Caffe.AccuracyParameter as Caffe (AccuracyParameter)
import qualified Gen.Caffe.ArgMaxParameter as Caffe (ArgMaxParameter)
import qualified Gen.Caffe.BlobProto as Caffe (BlobProto)
import qualified Gen.Caffe.ConcatParameter as Caffe (ConcatParameter)
import qualified Gen.Caffe.ContrastiveLossParameter as Caffe (ContrastiveLossParameter)
import qualified Gen.Caffe.ConvolutionParameter as Caffe (ConvolutionParameter)
import qualified Gen.Caffe.DataParameter as Caffe (DataParameter)
import qualified Gen.Caffe.DropoutParameter as Caffe (DropoutParameter)
import qualified Gen.Caffe.DummyDataParameter as Caffe (DummyDataParameter)
import qualified Gen.Caffe.EltwiseParameter as Caffe (EltwiseParameter)
import qualified Gen.Caffe.ExpParameter as Caffe (ExpParameter)
import qualified Gen.Caffe.HDF5DataParameter as Caffe (HDF5DataParameter)
import qualified Gen.Caffe.HDF5OutputParameter as Caffe (HDF5OutputParameter)
import qualified Gen.Caffe.HingeLossParameter as Caffe (HingeLossParameter)
import qualified Gen.Caffe.ImageDataParameter as Caffe (ImageDataParameter)
import qualified Gen.Caffe.InfogainLossParameter as Caffe (InfogainLossParameter)
import qualified Gen.Caffe.InnerProductParameter as Caffe (InnerProductParameter)
import qualified Gen.Caffe.LRNParameter as Caffe (LRNParameter)
import qualified Gen.Caffe.LossParameter as Caffe (LossParameter)
import qualified Gen.Caffe.MVNParameter as Caffe (MVNParameter)
import qualified Gen.Caffe.MemoryDataParameter as Caffe (MemoryDataParameter)
import qualified Gen.Caffe.NetStateRule as Caffe (NetStateRule)
import qualified Gen.Caffe.PoolingParameter as Caffe (PoolingParameter)
import qualified Gen.Caffe.PowerParameter as Caffe (PowerParameter)
import qualified Gen.Caffe.ReLUParameter as Caffe (ReLUParameter)
import qualified Gen.Caffe.SigmoidParameter as Caffe (SigmoidParameter)
import qualified Gen.Caffe.SliceParameter as Caffe (SliceParameter)
import qualified Gen.Caffe.SoftmaxParameter as Caffe (SoftmaxParameter)
import qualified Gen.Caffe.TanHParameter as Caffe (TanHParameter)
import qualified Gen.Caffe.ThresholdParameter as Caffe (ThresholdParameter)
import qualified Gen.Caffe.TransformationParameter as Caffe (TransformationParameter)
import qualified Gen.Caffe.V0LayerParameter as Caffe (V0LayerParameter)
import qualified Gen.Caffe.V1LayerParameter.DimCheckMode as Caffe.V1LayerParameter (DimCheckMode)
import qualified Gen.Caffe.V1LayerParameter.LayerType as Caffe.V1LayerParameter (LayerType)
import qualified Gen.Caffe.WindowDataParameter as Caffe (WindowDataParameter)
 
data V1LayerParameter = V1LayerParameter{bottom :: !(P'.Seq P'.Utf8), top :: !(P'.Seq P'.Utf8), name :: !(P'.Maybe P'.Utf8),
                                         include :: !(P'.Seq Caffe.NetStateRule), exclude :: !(P'.Seq Caffe.NetStateRule),
                                         type' :: !(P'.Maybe Caffe.V1LayerParameter.LayerType), blobs :: !(P'.Seq Caffe.BlobProto),
                                         param :: !(P'.Seq P'.Utf8),
                                         blob_share_mode :: !(P'.Seq Caffe.V1LayerParameter.DimCheckMode),
                                         blobs_lr :: !(P'.Seq P'.Float), weight_decay :: !(P'.Seq P'.Float),
                                         loss_weight :: !(P'.Seq P'.Float), accuracy_param :: !(P'.Maybe Caffe.AccuracyParameter),
                                         argmax_param :: !(P'.Maybe Caffe.ArgMaxParameter),
                                         concat_param :: !(P'.Maybe Caffe.ConcatParameter),
                                         contrastive_loss_param :: !(P'.Maybe Caffe.ContrastiveLossParameter),
                                         convolution_param :: !(P'.Maybe Caffe.ConvolutionParameter),
                                         data_param :: !(P'.Maybe Caffe.DataParameter),
                                         dropout_param :: !(P'.Maybe Caffe.DropoutParameter),
                                         dummy_data_param :: !(P'.Maybe Caffe.DummyDataParameter),
                                         eltwise_param :: !(P'.Maybe Caffe.EltwiseParameter),
                                         exp_param :: !(P'.Maybe Caffe.ExpParameter),
                                         hdf5_data_param :: !(P'.Maybe Caffe.HDF5DataParameter),
                                         hdf5_output_param :: !(P'.Maybe Caffe.HDF5OutputParameter),
                                         hinge_loss_param :: !(P'.Maybe Caffe.HingeLossParameter),
                                         image_data_param :: !(P'.Maybe Caffe.ImageDataParameter),
                                         infogain_loss_param :: !(P'.Maybe Caffe.InfogainLossParameter),
                                         inner_product_param :: !(P'.Maybe Caffe.InnerProductParameter),
                                         lrn_param :: !(P'.Maybe Caffe.LRNParameter),
                                         memory_data_param :: !(P'.Maybe Caffe.MemoryDataParameter),
                                         mvn_param :: !(P'.Maybe Caffe.MVNParameter),
                                         pooling_param :: !(P'.Maybe Caffe.PoolingParameter),
                                         power_param :: !(P'.Maybe Caffe.PowerParameter),
                                         relu_param :: !(P'.Maybe Caffe.ReLUParameter),
                                         sigmoid_param :: !(P'.Maybe Caffe.SigmoidParameter),
                                         softmax_param :: !(P'.Maybe Caffe.SoftmaxParameter),
                                         slice_param :: !(P'.Maybe Caffe.SliceParameter),
                                         tanh_param :: !(P'.Maybe Caffe.TanHParameter),
                                         threshold_param :: !(P'.Maybe Caffe.ThresholdParameter),
                                         window_data_param :: !(P'.Maybe Caffe.WindowDataParameter),
                                         transform_param :: !(P'.Maybe Caffe.TransformationParameter),
                                         loss_param :: !(P'.Maybe Caffe.LossParameter), layer :: !(P'.Maybe Caffe.V0LayerParameter)}
                      deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable V1LayerParameter where
  mergeAppend
   (V1LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
     x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43)
   (V1LayerParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24
     y'25 y'26 y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35 y'36 y'37 y'38 y'39 y'40 y'41 y'42 y'43)
   = V1LayerParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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
      (P'.mergeAppend x'36 y'36)
      (P'.mergeAppend x'37 y'37)
      (P'.mergeAppend x'38 y'38)
      (P'.mergeAppend x'39 y'39)
      (P'.mergeAppend x'40 y'40)
      (P'.mergeAppend x'41 y'41)
      (P'.mergeAppend x'42 y'42)
      (P'.mergeAppend x'43 y'43)
 
instance P'.Default V1LayerParameter where
  defaultValue
   = V1LayerParameter P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
      P'.defaultValue
 
instance P'.Wire V1LayerParameter where
  wireSize ft'
   self'@(V1LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeRep 1 9 x'1 + P'.wireSizeRep 1 9 x'2 + P'.wireSizeOpt 1 9 x'3 + P'.wireSizeRep 2 11 x'4 +
             P'.wireSizeRep 2 11 x'5
             + P'.wireSizeOpt 1 14 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeRep 2 9 x'8
             + P'.wireSizeRep 2 14 x'9
             + P'.wireSizeRep 1 2 x'10
             + P'.wireSizeRep 1 2 x'11
             + P'.wireSizeRep 2 2 x'12
             + P'.wireSizeOpt 2 11 x'13
             + P'.wireSizeOpt 2 11 x'14
             + P'.wireSizeOpt 1 11 x'15
             + P'.wireSizeOpt 2 11 x'16
             + P'.wireSizeOpt 1 11 x'17
             + P'.wireSizeOpt 1 11 x'18
             + P'.wireSizeOpt 1 11 x'19
             + P'.wireSizeOpt 2 11 x'20
             + P'.wireSizeOpt 2 11 x'21
             + P'.wireSizeOpt 2 11 x'22
             + P'.wireSizeOpt 1 11 x'23
             + P'.wireSizeOpt 1 11 x'24
             + P'.wireSizeOpt 2 11 x'25
             + P'.wireSizeOpt 1 11 x'26
             + P'.wireSizeOpt 2 11 x'27
             + P'.wireSizeOpt 2 11 x'28
             + P'.wireSizeOpt 2 11 x'29
             + P'.wireSizeOpt 2 11 x'30
             + P'.wireSizeOpt 2 11 x'31
             + P'.wireSizeOpt 2 11 x'32
             + P'.wireSizeOpt 2 11 x'33
             + P'.wireSizeOpt 2 11 x'34
             + P'.wireSizeOpt 2 11 x'35
             + P'.wireSizeOpt 2 11 x'36
             + P'.wireSizeOpt 2 11 x'37
             + P'.wireSizeOpt 2 11 x'38
             + P'.wireSizeOpt 2 11 x'39
             + P'.wireSizeOpt 2 11 x'40
             + P'.wireSizeOpt 2 11 x'41
             + P'.wireSizeOpt 2 11 x'42
             + P'.wireSizeOpt 1 11 x'43)
  wirePut ft'
   self'@(V1LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 11 x'43
             P'.wirePutRep 18 9 x'1
             P'.wirePutRep 26 9 x'2
             P'.wirePutOpt 34 9 x'3
             P'.wirePutOpt 40 14 x'6
             P'.wirePutRep 50 11 x'7
             P'.wirePutRep 61 2 x'10
             P'.wirePutRep 69 2 x'11
             P'.wirePutOpt 74 11 x'15
             P'.wirePutOpt 82 11 x'17
             P'.wirePutOpt 90 11 x'18
             P'.wirePutOpt 98 11 x'19
             P'.wirePutOpt 106 11 x'23
             P'.wirePutOpt 114 11 x'24
             P'.wirePutOpt 122 11 x'26
             P'.wirePutOpt 130 11 x'27
             P'.wirePutOpt 138 11 x'28
             P'.wirePutOpt 146 11 x'29
             P'.wirePutOpt 154 11 x'32
             P'.wirePutOpt 162 11 x'40
             P'.wirePutOpt 170 11 x'33
             P'.wirePutOpt 178 11 x'30
             P'.wirePutOpt 186 11 x'14
             P'.wirePutOpt 194 11 x'21
             P'.wirePutOpt 202 11 x'39
             P'.wirePutOpt 210 11 x'20
             P'.wirePutOpt 218 11 x'13
             P'.wirePutOpt 234 11 x'25
             P'.wirePutOpt 242 11 x'34
             P'.wirePutOpt 250 11 x'37
             P'.wirePutRep 258 11 x'4
             P'.wirePutRep 266 11 x'5
             P'.wirePutOpt 274 11 x'31
             P'.wirePutRep 285 2 x'12
             P'.wirePutOpt 290 11 x'41
             P'.wirePutOpt 298 11 x'38
             P'.wirePutOpt 306 11 x'35
             P'.wirePutOpt 314 11 x'36
             P'.wirePutOpt 322 11 x'16
             P'.wirePutOpt 330 11 x'22
             P'.wirePutOpt 338 11 x'42
             P'.wirePutRep 8010 9 x'8
             P'.wirePutRep 8016 14 x'9
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{bottom = P'.append (bottom old'Self) new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{top = P'.append (top old'Self) new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{name = Prelude'.Just new'Field}) (P'.wireGet 9)
             258 -> Prelude'.fmap (\ !new'Field -> old'Self{include = P'.append (include old'Self) new'Field}) (P'.wireGet 11)
             266 -> Prelude'.fmap (\ !new'Field -> old'Self{exclude = P'.append (exclude old'Self) new'Field}) (P'.wireGet 11)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 14)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{blobs = P'.append (blobs old'Self) new'Field}) (P'.wireGet 11)
             8010 -> Prelude'.fmap (\ !new'Field -> old'Self{param = P'.append (param old'Self) new'Field}) (P'.wireGet 9)
             8016 -> Prelude'.fmap (\ !new'Field -> old'Self{blob_share_mode = P'.append (blob_share_mode old'Self) new'Field})
                      (P'.wireGet 14)
             8018 -> Prelude'.fmap (\ !new'Field -> old'Self{blob_share_mode = P'.mergeAppend (blob_share_mode old'Self) new'Field})
                      (P'.wireGetPacked 14)
             61 -> Prelude'.fmap (\ !new'Field -> old'Self{blobs_lr = P'.append (blobs_lr old'Self) new'Field}) (P'.wireGet 2)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{blobs_lr = P'.mergeAppend (blobs_lr old'Self) new'Field})
                    (P'.wireGetPacked 2)
             69 -> Prelude'.fmap (\ !new'Field -> old'Self{weight_decay = P'.append (weight_decay old'Self) new'Field})
                    (P'.wireGet 2)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{weight_decay = P'.mergeAppend (weight_decay old'Self) new'Field})
                    (P'.wireGetPacked 2)
             285 -> Prelude'.fmap (\ !new'Field -> old'Self{loss_weight = P'.append (loss_weight old'Self) new'Field})
                     (P'.wireGet 2)
             282 -> Prelude'.fmap (\ !new'Field -> old'Self{loss_weight = P'.mergeAppend (loss_weight old'Self) new'Field})
                     (P'.wireGetPacked 2)
             218 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{accuracy_param = P'.mergeAppend (accuracy_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             186 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{argmax_param = P'.mergeAppend (argmax_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             74 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{concat_param = P'.mergeAppend (concat_param old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             322 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{contrastive_loss_param =
                                 P'.mergeAppend (contrastive_loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             82 -> Prelude'.fmap
                    (\ !new'Field ->
                      old'Self{convolution_param = P'.mergeAppend (convolution_param old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             90 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{data_param = P'.mergeAppend (data_param old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             98 -> Prelude'.fmap
                    (\ !new'Field -> old'Self{dropout_param = P'.mergeAppend (dropout_param old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             210 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{dummy_data_param = P'.mergeAppend (dummy_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             194 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{eltwise_param = P'.mergeAppend (eltwise_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             330 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{exp_param = P'.mergeAppend (exp_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             106 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{hdf5_data_param = P'.mergeAppend (hdf5_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             114 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{hdf5_output_param = P'.mergeAppend (hdf5_output_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             234 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{hinge_loss_param = P'.mergeAppend (hinge_loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             122 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{image_data_param = P'.mergeAppend (image_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             130 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{infogain_loss_param = P'.mergeAppend (infogain_loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             138 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{inner_product_param = P'.mergeAppend (inner_product_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             146 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{lrn_param = P'.mergeAppend (lrn_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             178 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{memory_data_param = P'.mergeAppend (memory_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             274 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{mvn_param = P'.mergeAppend (mvn_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             154 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{pooling_param = P'.mergeAppend (pooling_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             170 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{power_param = P'.mergeAppend (power_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             242 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{relu_param = P'.mergeAppend (relu_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             306 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{sigmoid_param = P'.mergeAppend (sigmoid_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             314 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{softmax_param = P'.mergeAppend (softmax_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             250 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{slice_param = P'.mergeAppend (slice_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             298 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{tanh_param = P'.mergeAppend (tanh_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             202 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{threshold_param = P'.mergeAppend (threshold_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             162 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{window_data_param = P'.mergeAppend (window_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             290 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{transform_param = P'.mergeAppend (transform_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             338 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{loss_param = P'.mergeAppend (loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{layer = P'.mergeAppend (layer old'Self) (Prelude'.Just new'Field)})
                    (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> V1LayerParameter) V1LayerParameter where
  getVal m' f' = f' m'
 
instance P'.GPB V1LayerParameter
 
instance P'.ReflectDescriptor V1LayerParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList
        [10, 18, 26, 34, 40, 50, 58, 61, 66, 69, 74, 82, 90, 98, 106, 114, 122, 130, 138, 146, 154, 162, 170, 178, 186, 194, 202,
         210, 218, 234, 242, 250, 258, 266, 274, 282, 285, 290, 298, 306, 314, 322, 330, 338, 8010, 8016, 8018])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.V1LayerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"V1LayerParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"V1LayerParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.bottom\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"bottom\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.top\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"top\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.name\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"name\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.include\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"include\"}, fieldNumber = FieldId {getFieldId = 32}, wireTag = WireTag {getWireTag = 258}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetStateRule\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetStateRule\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.exclude\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"exclude\"}, fieldNumber = FieldId {getFieldId = 33}, wireTag = WireTag {getWireTag = 266}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetStateRule\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetStateRule\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.type\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"type'\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.V1LayerParameter.LayerType\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName = MName \"LayerType\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.blobs\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"blobs\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.BlobProto\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobProto\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"param\"}, fieldNumber = FieldId {getFieldId = 1001}, wireTag = WireTag {getWireTag = 8010}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.blob_share_mode\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"blob_share_mode\"}, fieldNumber = FieldId {getFieldId = 1002}, wireTag = WireTag {getWireTag = 8016}, packedTag = Just (WireTag {getWireTag = 8016},WireTag {getWireTag = 8018}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.V1LayerParameter.DimCheckMode\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName = MName \"DimCheckMode\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.blobs_lr\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"blobs_lr\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 61}, packedTag = Just (WireTag {getWireTag = 61},WireTag {getWireTag = 58}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.weight_decay\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"weight_decay\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 69}, packedTag = Just (WireTag {getWireTag = 69},WireTag {getWireTag = 66}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.loss_weight\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"loss_weight\"}, fieldNumber = FieldId {getFieldId = 35}, wireTag = WireTag {getWireTag = 285}, packedTag = Just (WireTag {getWireTag = 285},WireTag {getWireTag = 282}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.accuracy_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"accuracy_param\"}, fieldNumber = FieldId {getFieldId = 27}, wireTag = WireTag {getWireTag = 218}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.AccuracyParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"AccuracyParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.argmax_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"argmax_param\"}, fieldNumber = FieldId {getFieldId = 23}, wireTag = WireTag {getWireTag = 186}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ArgMaxParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ArgMaxParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.concat_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"concat_param\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ConcatParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ConcatParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.contrastive_loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"contrastive_loss_param\"}, fieldNumber = FieldId {getFieldId = 40}, wireTag = WireTag {getWireTag = 322}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ContrastiveLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ContrastiveLossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.convolution_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"convolution_param\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ConvolutionParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ConvolutionParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"data_param\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 90}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.DataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.dropout_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"dropout_param\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 98}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.DropoutParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DropoutParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.dummy_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"dummy_data_param\"}, fieldNumber = FieldId {getFieldId = 26}, wireTag = WireTag {getWireTag = 210}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.DummyDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DummyDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.eltwise_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"eltwise_param\"}, fieldNumber = FieldId {getFieldId = 24}, wireTag = WireTag {getWireTag = 194}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.EltwiseParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"EltwiseParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.exp_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"exp_param\"}, fieldNumber = FieldId {getFieldId = 41}, wireTag = WireTag {getWireTag = 330}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ExpParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ExpParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.hdf5_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"hdf5_data_param\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 106}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HDF5DataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HDF5DataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.hdf5_output_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"hdf5_output_param\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HDF5OutputParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HDF5OutputParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.hinge_loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"hinge_loss_param\"}, fieldNumber = FieldId {getFieldId = 29}, wireTag = WireTag {getWireTag = 234}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HingeLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HingeLossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.image_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"image_data_param\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ImageDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ImageDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.infogain_loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"infogain_loss_param\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 130}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.InfogainLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"InfogainLossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.inner_product_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"inner_product_param\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 138}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.InnerProductParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"InnerProductParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.lrn_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"lrn_param\"}, fieldNumber = FieldId {getFieldId = 18}, wireTag = WireTag {getWireTag = 146}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.LRNParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LRNParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.memory_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"memory_data_param\"}, fieldNumber = FieldId {getFieldId = 22}, wireTag = WireTag {getWireTag = 178}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.MemoryDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"MemoryDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.mvn_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"mvn_param\"}, fieldNumber = FieldId {getFieldId = 34}, wireTag = WireTag {getWireTag = 274}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.MVNParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"MVNParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.pooling_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"pooling_param\"}, fieldNumber = FieldId {getFieldId = 19}, wireTag = WireTag {getWireTag = 154}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PoolingParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PoolingParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.power_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"power_param\"}, fieldNumber = FieldId {getFieldId = 21}, wireTag = WireTag {getWireTag = 170}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PowerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PowerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.relu_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"relu_param\"}, fieldNumber = FieldId {getFieldId = 30}, wireTag = WireTag {getWireTag = 242}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ReLUParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ReLUParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.sigmoid_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"sigmoid_param\"}, fieldNumber = FieldId {getFieldId = 38}, wireTag = WireTag {getWireTag = 306}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SigmoidParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SigmoidParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.softmax_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"softmax_param\"}, fieldNumber = FieldId {getFieldId = 39}, wireTag = WireTag {getWireTag = 314}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SoftmaxParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SoftmaxParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.slice_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"slice_param\"}, fieldNumber = FieldId {getFieldId = 31}, wireTag = WireTag {getWireTag = 250}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SliceParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SliceParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.tanh_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"tanh_param\"}, fieldNumber = FieldId {getFieldId = 37}, wireTag = WireTag {getWireTag = 298}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.TanHParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"TanHParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.threshold_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"threshold_param\"}, fieldNumber = FieldId {getFieldId = 25}, wireTag = WireTag {getWireTag = 202}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ThresholdParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ThresholdParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.window_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"window_data_param\"}, fieldNumber = FieldId {getFieldId = 20}, wireTag = WireTag {getWireTag = 162}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.WindowDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"WindowDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.transform_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"transform_param\"}, fieldNumber = FieldId {getFieldId = 36}, wireTag = WireTag {getWireTag = 290}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.TransformationParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"TransformationParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"loss_param\"}, fieldNumber = FieldId {getFieldId = 42}, wireTag = WireTag {getWireTag = 338}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.LossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.V1LayerParameter.layer\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"V1LayerParameter\"], baseName' = FName \"layer\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.V0LayerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"V0LayerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"