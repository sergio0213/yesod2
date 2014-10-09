{-# LANGUAGE OverloadedStrings #-}
import Network.HTTP.Types (status200)
import Network.Wai (Application, responseFile)
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = run 3000 app

app :: Application
app _req sendResponse = sendResponse $ responseFile
    status200
    [("Content-Type", "text/html")]
    "index.html"
    Nothing
