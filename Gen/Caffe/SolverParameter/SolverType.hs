{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SolverParameter.SolverType  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data SolverType = SGD
                | NESTEROV
                | ADAGRAD
                deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''SolverType

 
instance P'.Mergeable SolverType
 
instance Prelude'.Bounded SolverType where
  minBound = SGD
  maxBound = ADAGRAD
 
instance P'.Default SolverType where
  defaultValue = SGD
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe SolverType
toMaybe'Enum 0 = Prelude'.Just SGD
toMaybe'Enum 1 = Prelude'.Just NESTEROV
toMaybe'Enum 2 = Prelude'.Just ADAGRAD
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum SolverType where
  fromEnum SGD = 0
  fromEnum NESTEROV = 1
  fromEnum ADAGRAD = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.SolverParameter.SolverType") .
      toMaybe'Enum
  succ SGD = NESTEROV
  succ NESTEROV = ADAGRAD
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.SolverParameter.SolverType"
  pred NESTEROV = SGD
  pred ADAGRAD = NESTEROV
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.SolverParameter.SolverType"
 
instance P'.Wire SolverType where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB SolverType
 
instance P'.MessageAPI msg' (msg' -> SolverType) SolverType where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum SolverType where
  reflectEnum = [(0, "SGD", SGD), (1, "NESTEROV", NESTEROV), (2, "ADAGRAD", ADAGRAD)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.SolverParameter.SolverType") ["Gen"] ["Caffe", "SolverParameter"] "SolverType")
      ["Gen", "Caffe", "SolverParameter", "SolverType.hs"]
      [(0, "SGD"), (1, "NESTEROV"), (2, "ADAGRAD")]