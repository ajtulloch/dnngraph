{-# LANGUAGE DeriveFunctor              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
module NN.Backend.Purine.Codegen where

import           Control.Applicative
import           Control.Lens               hiding (assign)
import           Control.Monad.State.Strict
import qualified Data.Foldable              as F
import           Data.Monoid
import           Gen.Caffe.LayerParameter   as LP
import           NN.Backend.Purine.Purine
import           Text.Printf

lines = ["const std::unordered_map<BlobID, std::unique_ptr<Blob>> blobs"]
