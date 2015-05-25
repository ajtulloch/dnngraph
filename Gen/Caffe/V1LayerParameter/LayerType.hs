{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.V1LayerParameter.LayerType  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data LayerType = NONE
               | ABSVAL
               | ACCURACY
               | ARGMAX
               | BNLL
               | CONCAT
               | CONTRASTIVE_LOSS
               | CONVOLUTION
               | DATA
               | DECONVOLUTION
               | DROPOUT
               | DUMMY_DATA
               | EUCLIDEAN_LOSS
               | ELTWISE
               | EXP
               | FLATTEN
               | HDF5_DATA
               | HDF5_OUTPUT
               | HINGE_LOSS
               | IM2COL
               | IMAGE_DATA
               | INFOGAIN_LOSS
               | INNER_PRODUCT
               | LRN
               | MEMORY_DATA
               | MULTINOMIAL_LOGISTIC_LOSS
               | MVN
               | POOLING
               | POWER
               | RELU
               | SIGMOID
               | SIGMOID_CROSS_ENTROPY_LOSS
               | SILENCE
               | SOFTMAX
               | SOFTMAX_LOSS
               | SPLIT
               | SLICE
               | TANH
               | WINDOW_DATA
               | THRESHOLD
               deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''LayerType

 
instance P'.Mergeable LayerType
 
instance Prelude'.Bounded LayerType where
  minBound = NONE
  maxBound = THRESHOLD
 
instance P'.Default LayerType where
  defaultValue = NONE
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe LayerType
toMaybe'Enum 0 = Prelude'.Just NONE
toMaybe'Enum 35 = Prelude'.Just ABSVAL
toMaybe'Enum 1 = Prelude'.Just ACCURACY
toMaybe'Enum 30 = Prelude'.Just ARGMAX
toMaybe'Enum 2 = Prelude'.Just BNLL
toMaybe'Enum 3 = Prelude'.Just CONCAT
toMaybe'Enum 37 = Prelude'.Just CONTRASTIVE_LOSS
toMaybe'Enum 4 = Prelude'.Just CONVOLUTION
toMaybe'Enum 5 = Prelude'.Just DATA
toMaybe'Enum 39 = Prelude'.Just DECONVOLUTION
toMaybe'Enum 6 = Prelude'.Just DROPOUT
toMaybe'Enum 32 = Prelude'.Just DUMMY_DATA
toMaybe'Enum 7 = Prelude'.Just EUCLIDEAN_LOSS
toMaybe'Enum 25 = Prelude'.Just ELTWISE
toMaybe'Enum 38 = Prelude'.Just EXP
toMaybe'Enum 8 = Prelude'.Just FLATTEN
toMaybe'Enum 9 = Prelude'.Just HDF5_DATA
toMaybe'Enum 10 = Prelude'.Just HDF5_OUTPUT
toMaybe'Enum 28 = Prelude'.Just HINGE_LOSS
toMaybe'Enum 11 = Prelude'.Just IM2COL
toMaybe'Enum 12 = Prelude'.Just IMAGE_DATA
toMaybe'Enum 13 = Prelude'.Just INFOGAIN_LOSS
toMaybe'Enum 14 = Prelude'.Just INNER_PRODUCT
toMaybe'Enum 15 = Prelude'.Just LRN
toMaybe'Enum 29 = Prelude'.Just MEMORY_DATA
toMaybe'Enum 16 = Prelude'.Just MULTINOMIAL_LOGISTIC_LOSS
toMaybe'Enum 34 = Prelude'.Just MVN
toMaybe'Enum 17 = Prelude'.Just POOLING
toMaybe'Enum 26 = Prelude'.Just POWER
toMaybe'Enum 18 = Prelude'.Just RELU
toMaybe'Enum 19 = Prelude'.Just SIGMOID
toMaybe'Enum 27 = Prelude'.Just SIGMOID_CROSS_ENTROPY_LOSS
toMaybe'Enum 36 = Prelude'.Just SILENCE
toMaybe'Enum 20 = Prelude'.Just SOFTMAX
toMaybe'Enum 21 = Prelude'.Just SOFTMAX_LOSS
toMaybe'Enum 22 = Prelude'.Just SPLIT
toMaybe'Enum 33 = Prelude'.Just SLICE
toMaybe'Enum 23 = Prelude'.Just TANH
toMaybe'Enum 24 = Prelude'.Just WINDOW_DATA
toMaybe'Enum 31 = Prelude'.Just THRESHOLD
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum LayerType where
  fromEnum NONE = 0
  fromEnum ABSVAL = 35
  fromEnum ACCURACY = 1
  fromEnum ARGMAX = 30
  fromEnum BNLL = 2
  fromEnum CONCAT = 3
  fromEnum CONTRASTIVE_LOSS = 37
  fromEnum CONVOLUTION = 4
  fromEnum DATA = 5
  fromEnum DECONVOLUTION = 39
  fromEnum DROPOUT = 6
  fromEnum DUMMY_DATA = 32
  fromEnum EUCLIDEAN_LOSS = 7
  fromEnum ELTWISE = 25
  fromEnum EXP = 38
  fromEnum FLATTEN = 8
  fromEnum HDF5_DATA = 9
  fromEnum HDF5_OUTPUT = 10
  fromEnum HINGE_LOSS = 28
  fromEnum IM2COL = 11
  fromEnum IMAGE_DATA = 12
  fromEnum INFOGAIN_LOSS = 13
  fromEnum INNER_PRODUCT = 14
  fromEnum LRN = 15
  fromEnum MEMORY_DATA = 29
  fromEnum MULTINOMIAL_LOGISTIC_LOSS = 16
  fromEnum MVN = 34
  fromEnum POOLING = 17
  fromEnum POWER = 26
  fromEnum RELU = 18
  fromEnum SIGMOID = 19
  fromEnum SIGMOID_CROSS_ENTROPY_LOSS = 27
  fromEnum SILENCE = 36
  fromEnum SOFTMAX = 20
  fromEnum SOFTMAX_LOSS = 21
  fromEnum SPLIT = 22
  fromEnum SLICE = 33
  fromEnum TANH = 23
  fromEnum WINDOW_DATA = 24
  fromEnum THRESHOLD = 31
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.V1LayerParameter.LayerType") .
      toMaybe'Enum
  succ NONE = ABSVAL
  succ ABSVAL = ACCURACY
  succ ACCURACY = ARGMAX
  succ ARGMAX = BNLL
  succ BNLL = CONCAT
  succ CONCAT = CONTRASTIVE_LOSS
  succ CONTRASTIVE_LOSS = CONVOLUTION
  succ CONVOLUTION = DATA
  succ DATA = DECONVOLUTION
  succ DECONVOLUTION = DROPOUT
  succ DROPOUT = DUMMY_DATA
  succ DUMMY_DATA = EUCLIDEAN_LOSS
  succ EUCLIDEAN_LOSS = ELTWISE
  succ ELTWISE = EXP
  succ EXP = FLATTEN
  succ FLATTEN = HDF5_DATA
  succ HDF5_DATA = HDF5_OUTPUT
  succ HDF5_OUTPUT = HINGE_LOSS
  succ HINGE_LOSS = IM2COL
  succ IM2COL = IMAGE_DATA
  succ IMAGE_DATA = INFOGAIN_LOSS
  succ INFOGAIN_LOSS = INNER_PRODUCT
  succ INNER_PRODUCT = LRN
  succ LRN = MEMORY_DATA
  succ MEMORY_DATA = MULTINOMIAL_LOGISTIC_LOSS
  succ MULTINOMIAL_LOGISTIC_LOSS = MVN
  succ MVN = POOLING
  succ POOLING = POWER
  succ POWER = RELU
  succ RELU = SIGMOID
  succ SIGMOID = SIGMOID_CROSS_ENTROPY_LOSS
  succ SIGMOID_CROSS_ENTROPY_LOSS = SILENCE
  succ SILENCE = SOFTMAX
  succ SOFTMAX = SOFTMAX_LOSS
  succ SOFTMAX_LOSS = SPLIT
  succ SPLIT = SLICE
  succ SLICE = TANH
  succ TANH = WINDOW_DATA
  succ WINDOW_DATA = THRESHOLD
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.V1LayerParameter.LayerType"
  pred ABSVAL = NONE
  pred ACCURACY = ABSVAL
  pred ARGMAX = ACCURACY
  pred BNLL = ARGMAX
  pred CONCAT = BNLL
  pred CONTRASTIVE_LOSS = CONCAT
  pred CONVOLUTION = CONTRASTIVE_LOSS
  pred DATA = CONVOLUTION
  pred DECONVOLUTION = DATA
  pred DROPOUT = DECONVOLUTION
  pred DUMMY_DATA = DROPOUT
  pred EUCLIDEAN_LOSS = DUMMY_DATA
  pred ELTWISE = EUCLIDEAN_LOSS
  pred EXP = ELTWISE
  pred FLATTEN = EXP
  pred HDF5_DATA = FLATTEN
  pred HDF5_OUTPUT = HDF5_DATA
  pred HINGE_LOSS = HDF5_OUTPUT
  pred IM2COL = HINGE_LOSS
  pred IMAGE_DATA = IM2COL
  pred INFOGAIN_LOSS = IMAGE_DATA
  pred INNER_PRODUCT = INFOGAIN_LOSS
  pred LRN = INNER_PRODUCT
  pred MEMORY_DATA = LRN
  pred MULTINOMIAL_LOGISTIC_LOSS = MEMORY_DATA
  pred MVN = MULTINOMIAL_LOGISTIC_LOSS
  pred POOLING = MVN
  pred POWER = POOLING
  pred RELU = POWER
  pred SIGMOID = RELU
  pred SIGMOID_CROSS_ENTROPY_LOSS = SIGMOID
  pred SILENCE = SIGMOID_CROSS_ENTROPY_LOSS
  pred SOFTMAX = SILENCE
  pred SOFTMAX_LOSS = SOFTMAX
  pred SPLIT = SOFTMAX_LOSS
  pred SLICE = SPLIT
  pred TANH = SLICE
  pred WINDOW_DATA = TANH
  pred THRESHOLD = WINDOW_DATA
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.V1LayerParameter.LayerType"
 
instance P'.Wire LayerType where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB LayerType
 
instance P'.MessageAPI msg' (msg' -> LayerType) LayerType where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum LayerType where
  reflectEnum
   = [(0, "NONE", NONE), (35, "ABSVAL", ABSVAL), (1, "ACCURACY", ACCURACY), (30, "ARGMAX", ARGMAX), (2, "BNLL", BNLL),
      (3, "CONCAT", CONCAT), (37, "CONTRASTIVE_LOSS", CONTRASTIVE_LOSS), (4, "CONVOLUTION", CONVOLUTION), (5, "DATA", DATA),
      (39, "DECONVOLUTION", DECONVOLUTION), (6, "DROPOUT", DROPOUT), (32, "DUMMY_DATA", DUMMY_DATA),
      (7, "EUCLIDEAN_LOSS", EUCLIDEAN_LOSS), (25, "ELTWISE", ELTWISE), (38, "EXP", EXP), (8, "FLATTEN", FLATTEN),
      (9, "HDF5_DATA", HDF5_DATA), (10, "HDF5_OUTPUT", HDF5_OUTPUT), (28, "HINGE_LOSS", HINGE_LOSS), (11, "IM2COL", IM2COL),
      (12, "IMAGE_DATA", IMAGE_DATA), (13, "INFOGAIN_LOSS", INFOGAIN_LOSS), (14, "INNER_PRODUCT", INNER_PRODUCT), (15, "LRN", LRN),
      (29, "MEMORY_DATA", MEMORY_DATA), (16, "MULTINOMIAL_LOGISTIC_LOSS", MULTINOMIAL_LOGISTIC_LOSS), (34, "MVN", MVN),
      (17, "POOLING", POOLING), (26, "POWER", POWER), (18, "RELU", RELU), (19, "SIGMOID", SIGMOID),
      (27, "SIGMOID_CROSS_ENTROPY_LOSS", SIGMOID_CROSS_ENTROPY_LOSS), (36, "SILENCE", SILENCE), (20, "SOFTMAX", SOFTMAX),
      (21, "SOFTMAX_LOSS", SOFTMAX_LOSS), (22, "SPLIT", SPLIT), (33, "SLICE", SLICE), (23, "TANH", TANH),
      (24, "WINDOW_DATA", WINDOW_DATA), (31, "THRESHOLD", THRESHOLD)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.V1LayerParameter.LayerType") ["Gen"] ["Caffe", "V1LayerParameter"] "LayerType")
      ["Gen", "Caffe", "V1LayerParameter", "LayerType.hs"]
      [(0, "NONE"), (35, "ABSVAL"), (1, "ACCURACY"), (30, "ARGMAX"), (2, "BNLL"), (3, "CONCAT"), (37, "CONTRASTIVE_LOSS"),
       (4, "CONVOLUTION"), (5, "DATA"), (39, "DECONVOLUTION"), (6, "DROPOUT"), (32, "DUMMY_DATA"), (7, "EUCLIDEAN_LOSS"),
       (25, "ELTWISE"), (38, "EXP"), (8, "FLATTEN"), (9, "HDF5_DATA"), (10, "HDF5_OUTPUT"), (28, "HINGE_LOSS"), (11, "IM2COL"),
       (12, "IMAGE_DATA"), (13, "INFOGAIN_LOSS"), (14, "INNER_PRODUCT"), (15, "LRN"), (29, "MEMORY_DATA"),
       (16, "MULTINOMIAL_LOGISTIC_LOSS"), (34, "MVN"), (17, "POOLING"), (26, "POWER"), (18, "RELU"), (19, "SIGMOID"),
       (27, "SIGMOID_CROSS_ENTROPY_LOSS"), (36, "SILENCE"), (20, "SOFTMAX"), (21, "SOFTMAX_LOSS"), (22, "SPLIT"), (33, "SLICE"),
       (23, "TANH"), (24, "WINDOW_DATA"), (31, "THRESHOLD")]