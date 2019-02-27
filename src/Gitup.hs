module Gitup
  ( updateAll
  ) where


import           Control.Applicative
import           Control.Monad
import           System.Directory
import           System.FilePath


updateAll :: String -> IO ()
updateAll dir = listSubdirs dir >>= filterM doesDirectoryExist >>= print


listSubdirs :: FilePath -> IO [FilePath]
listSubdirs fp =
  map (fp </>) . filter (`notElem` [".",".."]) <$> listDirectory fp
