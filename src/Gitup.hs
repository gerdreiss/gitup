module Gitup
  ( updateAll
  ) where

updateAll :: [String] -> IO ()
updateAll = mapM_ putStrLn
