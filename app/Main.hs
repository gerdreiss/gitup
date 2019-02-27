module Main where

import Gitup
import System.Environment (getArgs)

main :: IO ()
main = getArgs >>= updateAll
