{-# LANGUAGE TemplateHaskell #-}
module NN.CLI where

import           Control.Applicative
import           Control.Lens          hiding ((<.>))
import           Control.Monad
import qualified Data.ByteString.Lazy  as BS
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

netPdf :: NetBuilder a -> FilePath -> IO ()
netPdf net path = void $ visualize (parse net) & pdf path

torchCode :: NetBuilder a -> FilePath -> IO ()
torchCode net path = do
  let Just code = parse net & Torch.backend
  writeFile path code

data Command = Caffe { _fileName, _binaryToText :: String}
             | Torch { _fileName :: String }
             | PDF { _fileName :: String }
makeLenses ''Command
makePrisms ''Command

opts :: Parser Command
opts = subparser (caffe <> torch <> pdf')
       where
         nc name parser desc = command name (info (helper <*> parser) (progDesc desc))
         caffe = nc "caffe" (Caffe <$> fileName' <*> binaryToText') "Generate a Caffe .prototxt to run with `caffe train --model=<>"
         torch = nc "torch" (Torch <$> fileName') "Generate Lua code to be `require`'d into an existing Torch script"
         pdf' = nc "pdf" (PDF <$> fileName') "Generate a PDF visualizing the model's connectivity"
         fileName' = strOption (long "output" <> help "Write output to FILE" <> metavar "FILE")
         binaryToText' = strOption (long "binary_to_text"
                                   <> help "Path to binary_to_text.py BINARY"
                                   <> showDefault
                                   <> metavar "BINARY"
                                   <> value "./binary_to_text.py")

run :: NetBuilder a -> Command -> IO ()
run net (Caffe prototxtPath binaryToTextPath) = caffePrototxt net prototxtPath binaryToTextPath
run net (Torch path) = torchCode net path
run net (PDF path) = netPdf net path

cli :: NetBuilder a -> IO ()
cli net = execParser (info (helper <*> opts) idm) >>= run net
