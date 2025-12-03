module Environment where

import Types

move :: Pos -> Action -> Pos
move (x,y) a =
    case a of
        UpA      -> (x-1, y)
        DownA    -> (x+1, y)
        LeftA    -> (x ,y-1)
        RightA   -> (x, y+1)

valid :: Pos -> Bool
valid (x,y) = (x >=0 && y >=0) && (x < gridSize && y < gridSize) && ((x,y) `notElem` obstacles)

-- Steps seriam basicamente as transitions
steps :: Pos -> Action -> (Pos, Double)
steps pos a =
    let p' = move pos a
    in if not (valid p') then (pos, -10)  -- Penalidade alta para movimentos inválidos
        else if p' == goalPos then (p', 100)  -- Recompensa alta para alcançar o objetivo
        else 
            let distToGoal = manhattanDistance p' goalPos
                prevDist = manhattanDistance pos goalPos
            in if distToGoal < prevDist 
               then (p', 1)      -- Pequena recompensa por se aproximar do objetivo
               else (p', -1)     -- Pequena penalidade por se afastar

-- Calcula a distância de Manhattan entre duas posições
manhattanDistance :: Pos -> Pos -> Int
manhattanDistance (x1, y1) (x2, y2) = abs (x1 - x2) + abs (y1 - y2)

showGrid :: Pos -> IO ()
showGrid agent =
    mapM_ putStrLn [concat [cell (x,y) | y <- [0 .. gridSize-1]] | x <- [0 .. gridSize-1]]
    where
        cell p
            | p == agent            = "A "
            | p == startPos         = "S "
            | p == goalPos          = "G "
            | p `elem` obstacles    = "X "
            | otherwise             = ". "