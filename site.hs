{-# LANGUAGE OverloadedStrings #-}

import Control.Monad
import Hakyll

main :: IO ()
main = hakyll $ do
    match "css/*.css" $ do
        route idRoute
        compile compressCssCompiler
    forM_ ["file/*", "font/*", "img/*", "js/*"] $ \pattern ->
        match pattern $ do
            route idRoute
            compile copyFileCompiler
    match "index.html" $ do
        route idRoute
        compile $ do
            body1 <- getResourceString
            relativizeUrls body1
