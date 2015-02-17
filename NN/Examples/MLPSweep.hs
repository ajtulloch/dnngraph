module NN.Examples.MLPSweep where

import           Control.Applicative
import           Control.Concurrent
import           Control.Lens
import           Control.Monad
import           Data.Function
import           Data.List
import           Data.Word
import           GHC.IO.Handle
import           System.Exit
import           System.IO.Temp
import           System.Process
import           Text.Read

import           NN.Backend.Torch    as Torch
import           NN.DSL
import           NN.Graph
import           NN.Passes

-- A simple example of performing a parameter sweep over the number of
-- hidden units in an MLP.
parameterSweepMLP :: Int -> IO ([Word32], Maybe Float)
parameterSweepMLP numWorkers = maximumBy (compare `on` snd) <$> parMapIO numWorkers candidates assess
  where
    mlp hiddenUnits = do
      _ <- sequential (concatMap (\n -> [ip n, relu]) hiddenUnits ++ [softmax])
      return ()

    candidates = [[i, j, k] | let xs = [10..15], i <- xs, j <- xs, k <- xs]

    assess experiment = do
      let Just torchCode = mlp experiment & parse & Torch.backend
      (file, handle) <- openTempFile "/tmp" "mlp.lua"
      hPutStr handle torchCode
      hClose handle
      (rc, stdout, _) <- readProcessWithExitCode "NN/Examples/scripts/run_mlp.lua" [file] ""
      return $ case rc of
                 ExitSuccess -> readMaybe stdout
                 _ -> Nothing

parMapIO :: Int -> [a] -> (a -> IO b) -> IO [(a, b)]
parMapIO n xs f = do
  jobs <- newChan
  results <- newChan
  forM_ [1..n] $ \_ -> forkIO $ worker jobs results
  forM_ xs (writeChan jobs)
  forM xs $ \_ -> readChan results
      where
        worker jobs results =
            forever $ do
                    job <- readChan jobs
                    result <- f job
                    writeChan results (job, result)
