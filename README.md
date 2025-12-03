# RLHaskell - Reinforcement Learning in Haskell

A Q-Learning implementation in Haskell for solving a grid world navigation problem. The agent learns to navigate from a starting position to a goal while avoiding obstacles using reinforcement learning.

## 🎯 Project Overview

This project implements a **Q-Learning algorithm** in Haskell where an agent learns to navigate through a 5x5 grid world. The agent starts at position (0,0) and must reach the goal at position (4,4) while avoiding obstacles.

### Key Features
- **Q-Learning Algorithm**: Temporal difference learning with exploration vs exploitation
- **Grid World Environment**: 5x5 grid with obstacles and rewards
- **Epsilon-Greedy Policy**: Balances exploration and exploitation during learning
- **Smart Reward System**: Encourages efficient pathfinding
- **Visual Feedback**: Shows the agent's movement and learning progress

## 🗺️ Environment

```
S . . . .
. X X . .
. . . X .
. X . . .
. . . . G
```

- **S**: Start position (0,0)
- **G**: Goal position (4,4) - Reward: +100
- **X**: Obstacles - Cannot move here
- **.**: Empty spaces
- **A**: Agent's current position

## 🏆 Reward System

| Action | Reward | Description |
|--------|--------|-------------|
| Reach Goal | +100 | Successfully reach position (4,4) |
| Move Closer | +1 | Move closer to goal (Manhattan distance) |
| Move Away | -1 | Move farther from goal |
| Invalid Move | -10 | Hit wall, obstacle, or grid boundary |

## 📁 Project Structure

```
RLHaskell/
├── src/
│   ├── Main.hs          # Main entry point
│   ├── Types.hs         # Data types and constants
│   ├── Environment.hs   # Grid world and physics
│   ├── Agent.hs         # Action selection strategies
│   ├── QTable.hs        # Q-table operations
│   └── Train.hs         # Training and episode management
├── RLHaskell.cabal      # Project configuration
├── README.md            # This file
└── .gitignore          # Git ignore rules
```

## 🚀 Getting Started

### Prerequisites

- **GHC** (Glasgow Haskell Compiler) 9.6.7 or later
- **Cabal** package manager
- **Git** for cloning the repository

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd RLHaskell
   ```

2. **Install dependencies:**
   ```bash
   cabal update
   cabal install --only-dependencies
   ```

3. **Build the project:**
   ```bash
   cabal build
   ```

### Running the Project

#### Option 1: Interactive Development (Recommended)

```bash
# Start GHCi with the project loaded
cabal repl

# In GHCi, load and run the main function
ghci> :l Main
ghci> main
```

#### Option 2: Direct Execution

```bash
# Build and run the executable
cabal run RLHaskell
```

## 🧠 How It Works

### Q-Learning Algorithm

The agent uses **Q-Learning**, a model-free reinforcement learning algorithm:

1. **Initialization**: Start with empty Q-table
2. **Training**: Run 200 episodes of exploration and learning
3. **Testing**: Demonstrate learned policy

### Key Parameters

```haskell
alpha = 0.1    -- Learning rate
gamma = 0.9    -- Discount factor  
epsilon = 0.1  -- Exploration rate
episodes = 200 -- Training episodes
```

### Learning Process

1. **Exploration Phase**: Agent randomly explores the environment
2. **Exploitation Phase**: Agent uses learned knowledge to make optimal moves
3. **Q-Value Updates**: Uses Bellman equation to improve action values
4. **Policy Improvement**: Gradually learns the optimal path to goal

## 🔧 Implementation Details

### Core Components

- **Types.hs**: Defines actions (Up, Down, Left, Right), positions, and Q-table structure
- **Environment.hs**: Implements grid physics, collision detection, and reward calculation
- **Agent.hs**: Handles action selection using epsilon-greedy strategy
- **QTable.hs**: Manages Q-value storage and retrieval
- **Train.hs**: Orchestrates training episodes and Q-learning updates
- **Main.hs**: Coordinates training and testing phases

### Smart Features

- **Manhattan Distance Rewards**: Encourages efficient pathfinding
- **Collision Avoidance**: Heavy penalties for invalid moves
- **Progress Visualization**: Shows training progress every 50 episodes
- **Infinite Loop Prevention**: Maximum 100 steps per episode

## 📊 Expected Output

```
Inicando treinamento...
Episódio 50/200
Episódio 100/200
Episódio 150/200
Episódio 200/200
Treinamento concluído!

Testando o agente treinado:
S A . . .
. X X . .
. . . X .
. X . . .
. . . . G
Recompensa: 1.0
...
```

## 🎯 Learning Objectives

This project demonstrates:

- **Functional Programming**: Pure functional approach to RL
- **Reinforcement Learning**: Q-Learning implementation
- **Haskell Type System**: Strong typing for ML algorithms
- **Monadic IO**: Handling randomness and side effects
- **Algorithm Design**: Efficient learning and exploration strategies

## 🔬 Experimentation

Try modifying these parameters to see different behaviors:

- **Grid Size**: Change `gridSize` in Types.hs
- **Learning Rate**: Adjust `alpha` for faster/slower learning
- **Exploration**: Modify `epsilon` for more/less exploration
- **Episodes**: Change training duration
- **Obstacles**: Add/remove obstacles in Types.hs