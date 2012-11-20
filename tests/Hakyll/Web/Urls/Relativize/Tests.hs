--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
module Hakyll.Web.Urls.Relativize.Tests
    ( tests
    ) where


--------------------------------------------------------------------------------
import           Test.Framework             (Test, testGroup)
import           Test.HUnit                 ((@=?))


--------------------------------------------------------------------------------
import           Hakyll.Web.Urls.Relativize
import           TestSuite.Util


--------------------------------------------------------------------------------
tests :: Test
tests = testGroup "Hakyll.Web.Urls.Relativize.Tests" $
    fromAssertions "relativizeUrls"
        [ "<a href=\"../foo\">bar</a>" @=?
            relativizeUrlsWith ".." "<a href=\"/foo\">bar</a>"
        , "<img src=\"../../images/lolcat.png\"></img>" @=?
            relativizeUrlsWith "../.." "<img src=\"/images/lolcat.png\" />"
        , "<a href=\"http://haskell.org\">Haskell</a>" @=?
            relativizeUrlsWith "../.."
                "<a href=\"http://haskell.org\">Haskell</a>"
        , "<a href=\"http://haskell.org\">Haskell</a>" @=?
            relativizeUrlsWith "../.."
                "<a href=\"http://haskell.org\">Haskell</a>"
        , "<script src=\"//ajax.googleapis.com/jquery.min.js\"></script>" @=?
            relativizeUrlsWith "../.."
                "<script src=\"//ajax.googleapis.com/jquery.min.js\"></script>"
        ]
