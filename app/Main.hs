module Main where

import Gitup
import System.Environment (getArgs)

main :: IO ()
main = do
    [path] <- getArgs
    updateAll path
