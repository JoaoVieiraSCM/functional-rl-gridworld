module Agent where

import Types
import QTable
import System.Random

allActions :: [Action]
allActions = [minBound .. maxBound]

chooseAction :: QTable -> Pos -> IO Action
chooseAction q pos = do
    r <- randomRIO (0.0, 1.0)
    if r < epsilon
        then do
            idx <- randomRIO (0, length allActions -1)
            pure (allActions !! idx)
        else
            pure (bestAction q pos)

bestAction :: QTable -> Pos -> Action
bestAction q pos = snd $ maximum [(qGet q pos a, a) | a <- allActions]