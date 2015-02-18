module NN.Backend.Torch where

import           NN.Backend.Torch.Codegen
import           NN.Backend.Torch.Flat
import           NN.Backend.Torch.Torch
import           NN.DSL

backend :: Net -> Maybe String
backend gr = do
  flat <- flatten' $ clean gr
  return $ codegen $ lower flat

