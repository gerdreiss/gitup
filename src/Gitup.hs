module Gitup
  ( updateAll
  ) where

import Control.Monad
import System.Directory
import System.FilePath

updateAll :: String -> IO ()
updateAll dir =
  listSubdirs dir >>= filterM doesDirectoryExist >>= filterM isGitRepo >>= print

listSubdirs :: FilePath -> IO [FilePath]
listSubdirs root =
  map (root </>) . filter (`notElem` [".", ".."]) <$> listDirectory root

isGitRepo :: FilePath -> IO Bool
isGitRepo dir = do
  subdirs <- listDirectory dir
  return $ elem ".git" subdirs
