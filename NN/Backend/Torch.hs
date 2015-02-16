module NN.Backend.Torch(NN.Backend.Torch.backend) where

import           NN.Backend.Torch.Codegen
import           NN.Backend.Torch.Torch

import           NN.DSL

backend :: Net -> Maybe String
backend  = fmap (codegen . lower) . linearize . clean
