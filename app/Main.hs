module Main where

import Gitup (updateAll)
import System.Environment (getArgs)

main :: IO ()
main = do
  [path] <- getArgs
  updateAll path
