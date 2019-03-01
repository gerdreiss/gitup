module Gitup
  ( updateAll
  ) where

import Control.Monad (filterM)
import System.Directory (doesDirectoryExist, listDirectory)
import System.FilePath (FilePath, (</>))
import System.Process.Typed (proc, runProcess_)

updateAll :: String -> IO ()
updateAll dir =
  listSubdirs dir >>= filterM doesDirectoryExist >>= filterM isGitRepo >>=
  mapM_ updateRepo

listSubdirs :: FilePath -> IO [FilePath]
listSubdirs root =
  map (root </>) . filter (`notElem` [".", ".."]) <$> listDirectory root

isGitRepo :: FilePath -> IO Bool
isGitRepo dir = elem ".git" <$> listDirectory dir

updateRepo :: FilePath -> IO ()
updateRepo path = do
  runProcess_ $ proc "cd" [path]
  putStrLn $ "updating " ++ path
  runProcess_ $ proc "git" ["pull"]
