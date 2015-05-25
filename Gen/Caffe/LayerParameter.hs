{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.LayerParameter  where
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
import qualified Gen.Caffe.PReLUParameter as Caffe (PReLUParameter)
import qualified Gen.Caffe.ParamSpec as Caffe (ParamSpec)
import qualified Gen.Caffe.Phase as Caffe (Phase)
import qualified Gen.Caffe.PoolingParameter as Caffe (PoolingParameter)
import qualified Gen.Caffe.PowerParameter as Caffe (PowerParameter)
import qualified Gen.Caffe.PythonParameter as Caffe (PythonParameter)
import qualified Gen.Caffe.ReLUParameter as Caffe (ReLUParameter)
import qualified Gen.Caffe.ReshapeParameter as Caffe (ReshapeParameter)
import qualified Gen.Caffe.SPPParameter as Caffe (SPPParameter)
import qualified Gen.Caffe.SigmoidParameter as Caffe (SigmoidParameter)
import qualified Gen.Caffe.SliceParameter as Caffe (SliceParameter)
import qualified Gen.Caffe.SoftmaxParameter as Caffe (SoftmaxParameter)
import qualified Gen.Caffe.TanHParameter as Caffe (TanHParameter)
import qualified Gen.Caffe.ThresholdParameter as Caffe (ThresholdParameter)
import qualified Gen.Caffe.TransformationParameter as Caffe (TransformationParameter)
import qualified Gen.Caffe.WindowDataParameter as Caffe (WindowDataParameter)
 
import Language.Haskell.TH.Syntax
import Control.Lens
data LayerParameter = LayerParameter{name :: !(P'.Maybe P'.Utf8), type' :: !(P'.Maybe P'.Utf8), bottom :: !(P'.Seq P'.Utf8),
                                     top :: !(P'.Seq P'.Utf8), phase :: !(P'.Maybe Caffe.Phase), loss_weight :: !(P'.Seq P'.Float),
                                     param :: !(P'.Seq Caffe.ParamSpec), blobs :: !(P'.Seq Caffe.BlobProto),
                                     propagate_down :: !(P'.Seq P'.Bool), include :: !(P'.Seq Caffe.NetStateRule),
                                     exclude :: !(P'.Seq Caffe.NetStateRule),
                                     transform_param :: !(P'.Maybe Caffe.TransformationParameter),
                                     loss_param :: !(P'.Maybe Caffe.LossParameter),
                                     accuracy_param :: !(P'.Maybe Caffe.AccuracyParameter),
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
                                     prelu_param :: !(P'.Maybe Caffe.PReLUParameter),
                                     python_param :: !(P'.Maybe Caffe.PythonParameter),
                                     relu_param :: !(P'.Maybe Caffe.ReLUParameter),
                                     reshape_param :: !(P'.Maybe Caffe.ReshapeParameter),
                                     sigmoid_param :: !(P'.Maybe Caffe.SigmoidParameter),
                                     softmax_param :: !(P'.Maybe Caffe.SoftmaxParameter),
                                     spp_param :: !(P'.Maybe Caffe.SPPParameter), slice_param :: !(P'.Maybe Caffe.SliceParameter),
                                     tanh_param :: !(P'.Maybe Caffe.TanHParameter),
                                     threshold_param :: !(P'.Maybe Caffe.ThresholdParameter),
                                     window_data_param :: !(P'.Maybe Caffe.WindowDataParameter)}
                    deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''LayerParameter

 
instance P'.Mergeable LayerParameter where
  mergeAppend
   (LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23 x'24
     x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44 x'45)
   (LayerParameter y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9 y'10 y'11 y'12 y'13 y'14 y'15 y'16 y'17 y'18 y'19 y'20 y'21 y'22 y'23 y'24
     y'25 y'26 y'27 y'28 y'29 y'30 y'31 y'32 y'33 y'34 y'35 y'36 y'37 y'38 y'39 y'40 y'41 y'42 y'43 y'44 y'45)
   = LayerParameter (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
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
      (P'.mergeAppend x'44 y'44)
      (P'.mergeAppend x'45 y'45)
 
instance P'.Default LayerParameter where
  defaultValue
   = LayerParameter P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
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
      P'.defaultValue
 
instance P'.Wire LayerParameter where
  wireSize ft'
   self'@(LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44 x'45)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 9 x'1 + P'.wireSizeOpt 1 9 x'2 + P'.wireSizeRep 1 9 x'3 + P'.wireSizeRep 1 9 x'4 +
             P'.wireSizeOpt 1 14 x'5
             + P'.wireSizeRep 1 2 x'6
             + P'.wireSizeRep 1 11 x'7
             + P'.wireSizeRep 1 11 x'8
             + P'.wireSizeRep 1 8 x'9
             + P'.wireSizeRep 1 11 x'10
             + P'.wireSizeRep 1 11 x'11
             + P'.wireSizeOpt 2 11 x'12
             + P'.wireSizeOpt 2 11 x'13
             + P'.wireSizeOpt 2 11 x'14
             + P'.wireSizeOpt 2 11 x'15
             + P'.wireSizeOpt 2 11 x'16
             + P'.wireSizeOpt 2 11 x'17
             + P'.wireSizeOpt 2 11 x'18
             + P'.wireSizeOpt 2 11 x'19
             + P'.wireSizeOpt 2 11 x'20
             + P'.wireSizeOpt 2 11 x'21
             + P'.wireSizeOpt 2 11 x'22
             + P'.wireSizeOpt 2 11 x'23
             + P'.wireSizeOpt 2 11 x'24
             + P'.wireSizeOpt 2 11 x'25
             + P'.wireSizeOpt 2 11 x'26
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
             + P'.wireSizeOpt 2 11 x'43
             + P'.wireSizeOpt 2 11 x'44
             + P'.wireSizeOpt 2 11 x'45)
  wirePut ft'
   self'@(LayerParameter x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9 x'10 x'11 x'12 x'13 x'14 x'15 x'16 x'17 x'18 x'19 x'20 x'21 x'22 x'23
           x'24 x'25 x'26 x'27 x'28 x'29 x'30 x'31 x'32 x'33 x'34 x'35 x'36 x'37 x'38 x'39 x'40 x'41 x'42 x'43 x'44 x'45)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutOpt 10 9 x'1
             P'.wirePutOpt 18 9 x'2
             P'.wirePutRep 26 9 x'3
             P'.wirePutRep 34 9 x'4
             P'.wirePutRep 45 2 x'6
             P'.wirePutRep 50 11 x'7
             P'.wirePutRep 58 11 x'8
             P'.wirePutRep 66 11 x'10
             P'.wirePutRep 74 11 x'11
             P'.wirePutOpt 80 14 x'5
             P'.wirePutRep 88 8 x'9
             P'.wirePutOpt 802 11 x'12
             P'.wirePutOpt 810 11 x'13
             P'.wirePutOpt 818 11 x'14
             P'.wirePutOpt 826 11 x'15
             P'.wirePutOpt 834 11 x'16
             P'.wirePutOpt 842 11 x'17
             P'.wirePutOpt 850 11 x'18
             P'.wirePutOpt 858 11 x'19
             P'.wirePutOpt 866 11 x'20
             P'.wirePutOpt 874 11 x'21
             P'.wirePutOpt 882 11 x'22
             P'.wirePutOpt 890 11 x'23
             P'.wirePutOpt 898 11 x'24
             P'.wirePutOpt 906 11 x'25
             P'.wirePutOpt 914 11 x'26
             P'.wirePutOpt 922 11 x'27
             P'.wirePutOpt 930 11 x'28
             P'.wirePutOpt 938 11 x'29
             P'.wirePutOpt 946 11 x'30
             P'.wirePutOpt 954 11 x'31
             P'.wirePutOpt 962 11 x'32
             P'.wirePutOpt 970 11 x'33
             P'.wirePutOpt 978 11 x'34
             P'.wirePutOpt 986 11 x'37
             P'.wirePutOpt 994 11 x'39
             P'.wirePutOpt 1002 11 x'40
             P'.wirePutOpt 1010 11 x'42
             P'.wirePutOpt 1018 11 x'43
             P'.wirePutOpt 1026 11 x'44
             P'.wirePutOpt 1034 11 x'45
             P'.wirePutOpt 1042 11 x'36
             P'.wirePutOpt 1050 11 x'35
             P'.wirePutOpt 1058 11 x'41
             P'.wirePutOpt 1066 11 x'38
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> Prelude'.fmap (\ !new'Field -> old'Self{name = Prelude'.Just new'Field}) (P'.wireGet 9)
             18 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = Prelude'.Just new'Field}) (P'.wireGet 9)
             26 -> Prelude'.fmap (\ !new'Field -> old'Self{bottom = P'.append (bottom old'Self) new'Field}) (P'.wireGet 9)
             34 -> Prelude'.fmap (\ !new'Field -> old'Self{top = P'.append (top old'Self) new'Field}) (P'.wireGet 9)
             80 -> Prelude'.fmap (\ !new'Field -> old'Self{phase = Prelude'.Just new'Field}) (P'.wireGet 14)
             45 -> Prelude'.fmap (\ !new'Field -> old'Self{loss_weight = P'.append (loss_weight old'Self) new'Field}) (P'.wireGet 2)
             42 -> Prelude'.fmap (\ !new'Field -> old'Self{loss_weight = P'.mergeAppend (loss_weight old'Self) new'Field})
                    (P'.wireGetPacked 2)
             50 -> Prelude'.fmap (\ !new'Field -> old'Self{param = P'.append (param old'Self) new'Field}) (P'.wireGet 11)
             58 -> Prelude'.fmap (\ !new'Field -> old'Self{blobs = P'.append (blobs old'Self) new'Field}) (P'.wireGet 11)
             88 -> Prelude'.fmap (\ !new'Field -> old'Self{propagate_down = P'.append (propagate_down old'Self) new'Field})
                    (P'.wireGet 8)
             90 -> Prelude'.fmap (\ !new'Field -> old'Self{propagate_down = P'.mergeAppend (propagate_down old'Self) new'Field})
                    (P'.wireGetPacked 8)
             66 -> Prelude'.fmap (\ !new'Field -> old'Self{include = P'.append (include old'Self) new'Field}) (P'.wireGet 11)
             74 -> Prelude'.fmap (\ !new'Field -> old'Self{exclude = P'.append (exclude old'Self) new'Field}) (P'.wireGet 11)
             802 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{transform_param = P'.mergeAppend (transform_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             810 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{loss_param = P'.mergeAppend (loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             818 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{accuracy_param = P'.mergeAppend (accuracy_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             826 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{argmax_param = P'.mergeAppend (argmax_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             834 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{concat_param = P'.mergeAppend (concat_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             842 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{contrastive_loss_param =
                                 P'.mergeAppend (contrastive_loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             850 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{convolution_param = P'.mergeAppend (convolution_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             858 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{data_param = P'.mergeAppend (data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             866 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{dropout_param = P'.mergeAppend (dropout_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             874 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{dummy_data_param = P'.mergeAppend (dummy_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             882 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{eltwise_param = P'.mergeAppend (eltwise_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             890 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{exp_param = P'.mergeAppend (exp_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             898 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{hdf5_data_param = P'.mergeAppend (hdf5_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             906 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{hdf5_output_param = P'.mergeAppend (hdf5_output_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             914 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{hinge_loss_param = P'.mergeAppend (hinge_loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             922 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{image_data_param = P'.mergeAppend (image_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             930 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{infogain_loss_param = P'.mergeAppend (infogain_loss_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             938 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{inner_product_param = P'.mergeAppend (inner_product_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             946 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{lrn_param = P'.mergeAppend (lrn_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             954 -> Prelude'.fmap
                     (\ !new'Field ->
                       old'Self{memory_data_param = P'.mergeAppend (memory_data_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             962 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{mvn_param = P'.mergeAppend (mvn_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             970 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{pooling_param = P'.mergeAppend (pooling_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             978 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{power_param = P'.mergeAppend (power_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             1050 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{prelu_param = P'.mergeAppend (prelu_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             1042 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{python_param = P'.mergeAppend (python_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             986 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{relu_param = P'.mergeAppend (relu_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             1066 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{reshape_param = P'.mergeAppend (reshape_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             994 -> Prelude'.fmap
                     (\ !new'Field -> old'Self{sigmoid_param = P'.mergeAppend (sigmoid_param old'Self) (Prelude'.Just new'Field)})
                     (P'.wireGet 11)
             1002 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{softmax_param = P'.mergeAppend (softmax_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             1058 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{spp_param = P'.mergeAppend (spp_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             1010 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{slice_param = P'.mergeAppend (slice_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             1018 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{tanh_param = P'.mergeAppend (tanh_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             1026 -> Prelude'.fmap
                      (\ !new'Field ->
                        old'Self{threshold_param = P'.mergeAppend (threshold_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             1034 -> Prelude'.fmap
                      (\ !new'Field ->
                        old'Self{window_data_param = P'.mergeAppend (window_data_param old'Self) (Prelude'.Just new'Field)})
                      (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> LayerParameter) LayerParameter where
  getVal m' f' = f' m'
 
instance P'.GPB LayerParameter
 
instance P'.ReflectDescriptor LayerParameter where
  getMessageInfo _
   = P'.GetMessageInfo (P'.fromDistinctAscList [])
      (P'.fromDistinctAscList
        [10, 18, 26, 34, 42, 45, 50, 58, 66, 74, 80, 88, 90, 802, 810, 818, 826, 834, 842, 850, 858, 866, 874, 882, 890, 898, 906,
         914, 922, 930, 938, 946, 954, 962, 970, 978, 986, 994, 1002, 1010, 1018, 1026, 1034, 1042, 1050, 1058, 1066])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".caffe.LayerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LayerParameter\"}, descFilePath = [\"Gen\",\"Caffe\",\"LayerParameter.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.name\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"name\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.type\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"type'\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.bottom\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"bottom\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.top\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"top\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.phase\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"phase\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 80}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".caffe.Phase\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"Phase\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.loss_weight\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"loss_weight\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 45}, packedTag = Just (WireTag {getWireTag = 45},WireTag {getWireTag = 42}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"param\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ParamSpec\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ParamSpec\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.blobs\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"blobs\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 58}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.BlobProto\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"BlobProto\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.propagate_down\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"propagate_down\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 88}, packedTag = Just (WireTag {getWireTag = 88},WireTag {getWireTag = 90}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.include\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"include\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 66}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetStateRule\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetStateRule\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.exclude\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"exclude\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.NetStateRule\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"NetStateRule\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.transform_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"transform_param\"}, fieldNumber = FieldId {getFieldId = 100}, wireTag = WireTag {getWireTag = 802}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.TransformationParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"TransformationParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"loss_param\"}, fieldNumber = FieldId {getFieldId = 101}, wireTag = WireTag {getWireTag = 810}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.LossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.accuracy_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"accuracy_param\"}, fieldNumber = FieldId {getFieldId = 102}, wireTag = WireTag {getWireTag = 818}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.AccuracyParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"AccuracyParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.argmax_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"argmax_param\"}, fieldNumber = FieldId {getFieldId = 103}, wireTag = WireTag {getWireTag = 826}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ArgMaxParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ArgMaxParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.concat_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"concat_param\"}, fieldNumber = FieldId {getFieldId = 104}, wireTag = WireTag {getWireTag = 834}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ConcatParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ConcatParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.contrastive_loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"contrastive_loss_param\"}, fieldNumber = FieldId {getFieldId = 105}, wireTag = WireTag {getWireTag = 842}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ContrastiveLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ContrastiveLossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.convolution_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"convolution_param\"}, fieldNumber = FieldId {getFieldId = 106}, wireTag = WireTag {getWireTag = 850}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ConvolutionParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ConvolutionParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"data_param\"}, fieldNumber = FieldId {getFieldId = 107}, wireTag = WireTag {getWireTag = 858}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.DataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.dropout_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"dropout_param\"}, fieldNumber = FieldId {getFieldId = 108}, wireTag = WireTag {getWireTag = 866}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.DropoutParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DropoutParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.dummy_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"dummy_data_param\"}, fieldNumber = FieldId {getFieldId = 109}, wireTag = WireTag {getWireTag = 874}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.DummyDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"DummyDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.eltwise_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"eltwise_param\"}, fieldNumber = FieldId {getFieldId = 110}, wireTag = WireTag {getWireTag = 882}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.EltwiseParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"EltwiseParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.exp_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"exp_param\"}, fieldNumber = FieldId {getFieldId = 111}, wireTag = WireTag {getWireTag = 890}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ExpParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ExpParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.hdf5_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"hdf5_data_param\"}, fieldNumber = FieldId {getFieldId = 112}, wireTag = WireTag {getWireTag = 898}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HDF5DataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HDF5DataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.hdf5_output_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"hdf5_output_param\"}, fieldNumber = FieldId {getFieldId = 113}, wireTag = WireTag {getWireTag = 906}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HDF5OutputParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HDF5OutputParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.hinge_loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"hinge_loss_param\"}, fieldNumber = FieldId {getFieldId = 114}, wireTag = WireTag {getWireTag = 914}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.HingeLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"HingeLossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.image_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"image_data_param\"}, fieldNumber = FieldId {getFieldId = 115}, wireTag = WireTag {getWireTag = 922}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ImageDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ImageDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.infogain_loss_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"infogain_loss_param\"}, fieldNumber = FieldId {getFieldId = 116}, wireTag = WireTag {getWireTag = 930}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.InfogainLossParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"InfogainLossParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.inner_product_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"inner_product_param\"}, fieldNumber = FieldId {getFieldId = 117}, wireTag = WireTag {getWireTag = 938}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.InnerProductParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"InnerProductParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.lrn_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"lrn_param\"}, fieldNumber = FieldId {getFieldId = 118}, wireTag = WireTag {getWireTag = 946}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.LRNParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"LRNParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.memory_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"memory_data_param\"}, fieldNumber = FieldId {getFieldId = 119}, wireTag = WireTag {getWireTag = 954}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.MemoryDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"MemoryDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.mvn_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"mvn_param\"}, fieldNumber = FieldId {getFieldId = 120}, wireTag = WireTag {getWireTag = 962}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.MVNParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"MVNParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.pooling_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"pooling_param\"}, fieldNumber = FieldId {getFieldId = 121}, wireTag = WireTag {getWireTag = 970}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PoolingParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PoolingParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.power_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"power_param\"}, fieldNumber = FieldId {getFieldId = 122}, wireTag = WireTag {getWireTag = 978}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PowerParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PowerParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.prelu_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"prelu_param\"}, fieldNumber = FieldId {getFieldId = 131}, wireTag = WireTag {getWireTag = 1050}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PReLUParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PReLUParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.python_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"python_param\"}, fieldNumber = FieldId {getFieldId = 130}, wireTag = WireTag {getWireTag = 1042}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.PythonParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"PythonParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.relu_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"relu_param\"}, fieldNumber = FieldId {getFieldId = 123}, wireTag = WireTag {getWireTag = 986}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ReLUParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ReLUParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.reshape_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"reshape_param\"}, fieldNumber = FieldId {getFieldId = 133}, wireTag = WireTag {getWireTag = 1066}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ReshapeParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ReshapeParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.sigmoid_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"sigmoid_param\"}, fieldNumber = FieldId {getFieldId = 124}, wireTag = WireTag {getWireTag = 994}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SigmoidParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SigmoidParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.softmax_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"softmax_param\"}, fieldNumber = FieldId {getFieldId = 125}, wireTag = WireTag {getWireTag = 1002}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SoftmaxParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SoftmaxParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.spp_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"spp_param\"}, fieldNumber = FieldId {getFieldId = 132}, wireTag = WireTag {getWireTag = 1058}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SPPParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SPPParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.slice_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"slice_param\"}, fieldNumber = FieldId {getFieldId = 126}, wireTag = WireTag {getWireTag = 1010}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.SliceParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"SliceParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.tanh_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"tanh_param\"}, fieldNumber = FieldId {getFieldId = 127}, wireTag = WireTag {getWireTag = 1018}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.TanHParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"TanHParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.threshold_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"threshold_param\"}, fieldNumber = FieldId {getFieldId = 128}, wireTag = WireTag {getWireTag = 1026}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.ThresholdParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"ThresholdParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".caffe.LayerParameter.window_data_param\", haskellPrefix' = [MName \"Gen\"], parentModule' = [MName \"Caffe\",MName \"LayerParameter\"], baseName' = FName \"window_data_param\"}, fieldNumber = FieldId {getFieldId = 129}, wireTag = WireTag {getWireTag = 1034}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".caffe.WindowDataParameter\", haskellPrefix = [MName \"Gen\"], parentModule = [MName \"Caffe\"], baseName = MName \"WindowDataParameter\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"