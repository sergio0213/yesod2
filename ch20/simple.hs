{-# LANGUAGE OverloadedStrings #-}
import Network.HTTP.Types (status200)
import Network.Wai (Application, pathInfo, responseLBS)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = run 3000 app

app :: Application
app req sendResponse =
    case pathInfo req of
        ["foo", "bar"] -> sendResponse $ responseLBS
            status200
            [("Content-Type", "text/plain")]
            "Your requested /foo/bar"
        _ -> sendResponse $ responseLBS
            status200
            [("Content-Type", "text/plain")]
            "You requested something else"
