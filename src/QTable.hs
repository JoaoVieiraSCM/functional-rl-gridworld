module QTable where

import Types

qGet :: QTable -> Pos -> Action -> Double
qGet [] _ _ = 0
qGet (((p,a),v):xs) pos act
    | p == pos && a == act = v
    | otherwise            = qGet xs pos act

qSet :: QTable -> Pos -> Action -> Double -> QTable
qSet [] pos act val = [((pos, act),val)]
qSet (((p,a),v):xs) pos act val
    | p == pos && act == a = ((pos, act),val) : xs
    | otherwise            = ((p, a), v) : qSet xs pos act val