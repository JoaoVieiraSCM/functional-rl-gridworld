module Main where

import Train
import Types
import QTable

main :: IO ()
main = do
    putStrLn "Iniciando treinamento..."
    let initialQ = []
    trainedQ <- train episodes initialQ
    putStrLn "Treinamento concluído!"
    putStrLn "\nTestando o agente treinado:"
    _ <- runEpisode trainedQ
    return ()