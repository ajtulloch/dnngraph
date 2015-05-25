{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SolverParameter.SolverMode  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data SolverMode = CPU
                | GPU
                deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''SolverMode

 
instance P'.Mergeable SolverMode
 
instance Prelude'.Bounded SolverMode where
  minBound = CPU
  maxBound = GPU
 
instance P'.Default SolverMode where
  defaultValue = CPU
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe SolverMode
toMaybe'Enum 0 = Prelude'.Just CPU
toMaybe'Enum 1 = Prelude'.Just GPU
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum SolverMode where
  fromEnum CPU = 0
  fromEnum GPU = 1
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.SolverParameter.SolverMode") .
      toMaybe'Enum
  succ CPU = GPU
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.SolverParameter.SolverMode"
  pred GPU = CPU
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.SolverParameter.SolverMode"
 
instance P'.Wire SolverMode where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB SolverMode
 
instance P'.MessageAPI msg' (msg' -> SolverMode) SolverMode where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum SolverMode where
  reflectEnum = [(0, "CPU", CPU), (1, "GPU", GPU)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.SolverParameter.SolverMode") ["Gen"] ["Caffe", "SolverParameter"] "SolverMode")
      ["Gen", "Caffe", "SolverParameter", "SolverMode.hs"]
      [(0, "CPU"), (1, "GPU")]