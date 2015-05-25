{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Gen.Caffe.SPPParameter.PoolMethod  where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
import Language.Haskell.TH.Syntax
import Control.Lens
data PoolMethod = MAX
                | AVE
                | STOCHASTIC
                deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)

makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''PoolMethod

 
instance P'.Mergeable PoolMethod
 
instance Prelude'.Bounded PoolMethod where
  minBound = MAX
  maxBound = STOCHASTIC
 
instance P'.Default PoolMethod where
  defaultValue = MAX
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe PoolMethod
toMaybe'Enum 0 = Prelude'.Just MAX
toMaybe'Enum 1 = Prelude'.Just AVE
toMaybe'Enum 2 = Prelude'.Just STOCHASTIC
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum PoolMethod where
  fromEnum MAX = 0
  fromEnum AVE = 1
  fromEnum STOCHASTIC = 2
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Gen.Caffe.SPPParameter.PoolMethod") .
      toMaybe'Enum
  succ MAX = AVE
  succ AVE = STOCHASTIC
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Gen.Caffe.SPPParameter.PoolMethod"
  pred AVE = MAX
  pred STOCHASTIC = AVE
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Gen.Caffe.SPPParameter.PoolMethod"
 
instance P'.Wire PoolMethod where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB PoolMethod
 
instance P'.MessageAPI msg' (msg' -> PoolMethod) PoolMethod where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum PoolMethod where
  reflectEnum = [(0, "MAX", MAX), (1, "AVE", AVE), (2, "STOCHASTIC", STOCHASTIC)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".caffe.SPPParameter.PoolMethod") ["Gen"] ["Caffe", "SPPParameter"] "PoolMethod")
      ["Gen", "Caffe", "SPPParameter", "PoolMethod.hs"]
      [(0, "MAX"), (1, "AVE"), (2, "STOCHASTIC")]