module Train where

import Types
import Environment
import Agent
import QTable
import Data.List (foldl')
import Control.Monad (when)

qUpdate :: QTable -> Pos -> Action -> Double -> Pos -> QTable
qUpdate q s a r s' =
    let oldQ = qGet q s a
        maxQNext = maximum [qGet q s' a' | a' <- allActions]
        newQ = oldQ + alpha * (r + gamma * maxQNext - oldQ)
    in qSet q s a newQ

runEpisode :: QTable -> IO QTable
runEpisode q0 = loop q0 startPos
    where
        loop q pos
            | pos == goalPos = return q
            | otherwise      = do
                a <- chooseAction q pos
                let (pos', r) = steps pos a
                showGrid pos'
                putStrLn ("Recompensa: " ++ show r)
                let q' = qUpdate q pos a r pos'
                loop q' pos'

trainEpisode :: QTable -> IO QTable
trainEpisode q0 = loop q0 startPos 0
    where
        loop q pos stepCount
            | pos == goalPos = return q
            | stepCount > 100 = return q
            | otherwise = do
                a <- chooseAction q pos
                let (pos', r) = steps pos a
                    q' = qUpdate q pos a r pos'
                loop q' pos' (stepCount + 1)

train :: Int -> QTable -> IO QTable
train numEpisodes q0 = loop q0 1
    where
        loop q episode
            | episode > numEpisodes = return q
            | otherwise = do
                when (episode `mod` 50 == 0) $ 
                    putStrLn $ "Episódio " ++ show episode ++ "/" ++ show numEpisodes
                q' <- trainEpisode q
                loop q' (episode + 1) 