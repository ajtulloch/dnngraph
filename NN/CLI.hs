{-# LANGUAGE TemplateHaskell #-}
module NN.CLI where

import           Control.Applicative
import           Control.Lens          hiding ((<.>))
import           Control.Monad
import qualified Data.ByteString.Lazy  as BS
import           Data.GraphViz         (GraphvizOutput (..))
import           NN.Backend.Caffe      as Caffe
import           NN.Backend.Torch      as Torch
import           NN.DSL
import           NN.Passes
import           NN.Visualize
import           Options.Applicative   hiding ((&))
import           System.Exit
import           System.FilePath.Posix
import           System.Process
import           Text.ProtocolBuffers  as P

caffePrototxt :: NetBuilder a -> FilePath -> String -> IO ()
caffePrototxt net prototxtPath binaryToText' = do
  parse net & Caffe.middleEnd & Caffe.backend & messagePut & BS.writeFile binaryPath
  rawSystem binaryToText' [binaryPath, prototxtPath] >>= exitWith
    where
      binaryPath = prototxtPath <.> "protobinary"

visualize' :: NetBuilder a -> GraphvizOutput -> FilePath -> IO ()
visualize' net format path = void $ visualize (parse net) & render format path

torchCode :: NetBuilder a -> FilePath -> IO ()
torchCode net path = do
  let Just code = parse net & Torch.backend
  writeFile path code

data Command = Caffe { _fileName, _binaryToText :: String}
             | Torch { _fileName :: String }
             | Visualize { _fileName :: String, _format :: String }
makeLenses ''Command
makePrisms ''Command

opts :: Parser Command
opts = subparser (caffe <> torch <> visualize'')
       where
         nc name parser desc = command name (info (helper <*> parser) (progDesc desc))
         caffe = nc "caffe" (Caffe <$> fileName' <*> binaryToText') "Generate a Caffe .prototxt to run with `caffe train --model=<>"
         torch = nc "torch" (Torch <$> fileName') "Generate Lua code to be `require`'d into an existing Torch script"
         visualize'' = nc "visualize" (Visualize <$> fileName' <*> vf) "Generate a Visualize visualizing the model's connectivity"
         fileName' = strOption (long "output" <> help "Write output to FILE" <> metavar "FILE")
         binaryToText' = strOption (long "binary_to_text"
                                   <> help "Path to binary_to_text.py BINARY"
                                   <> showDefault
                                   <> metavar "BINARY"
                                   <> value "./binary_to_text.py")
         vf = strOption (long "format" <> help "pdf or png")


run :: NetBuilder a -> Command -> IO ()
run net (Caffe prototxtPath binaryToTextPath) = caffePrototxt net prototxtPath binaryToTextPath
run net (Torch path) = torchCode net path
run net (Visualize path format) = visualize' net (fmtTy format) path
    where
      fmtTy "png" = Png
      fmtTy "pdf" = Pdf
      fmtTy _ = error "Must be pdf or png"

cli :: NetBuilder a -> IO ()
cli net = execParser (info (helper <*> opts) idm) >>= run net
