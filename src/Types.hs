module Types where

-- Definição dos tipos de dados usados

data Action = UpA | DownA | LeftA | RightA deriving (Eq, Show, Enum, Bounded, Ord)

type Pos = (Int,Int)

type QTable = [((Pos, Action), Double)]

-- Definição de variáveis da função QTable

-- Taxa de aprendizado - controla o grau de atualização dos valores Q
alpha :: Double
alpha = 0.1

-- Fator de desconto - peso dado às recompensas futuras
gamma :: Double
gamma = 0.9

-- Taxa de exploração - grau de ações aleatórias vs. exploitação
epsilon :: Double
epsilon = 0.1

-- Definição de variáveis globais

episodes :: Int
episodes = 200

gridSize :: Int
gridSize = 5

startPos :: Pos
startPos = (0,0)

goalPos :: Pos
goalPos = (4,4)

obstacles :: [Pos]
obstacles = 
    [
        (1,1), (1,2),
        (2,3),
        (3,1)
    ]