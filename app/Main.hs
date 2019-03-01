module Main where

import Gitup (updateAll)
import System.Environment (getArgs)

main :: IO ()
main = getArgs >>= pathFromArgsOrCurrent >>= updateAll

pathFromArgsOrCurrent :: [String] -> IO String
pathFromArgsOrCurrent args =
  return $
    case args of
      [] -> "."
      _ -> head args
