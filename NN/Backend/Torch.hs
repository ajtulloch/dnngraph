module NN.Backend.Torch(NN.Backend.Torch.backend) where

import           Control.Applicative

import           NN.Backend.Torch.Codegen
import           NN.Backend.Torch.Torch
import           NN.DSL

backend :: Net -> Maybe String
backend  = (codegen . lower <$>) . linearize . clean
