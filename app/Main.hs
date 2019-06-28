module Main where

{-# OPTIONS -Wall -Werror #-}
import Network.Socket

my_address :: IO String
my_address = withSocketsDo $ do
        (serveraddr:_) <- getAddrInfo Nothing (Just "128.0.0.0") (Just "echo")
        s <- socket AF_INET Datagram defaultProtocol
        connect s (addrAddress serveraddr)
        sockAddr <- getSocketName s
        let adrs = takeWhile (/=':') $ show sockAddr
        close s
        return adrs


main :: IO ()
main = do a <- my_address
          putStrLn a