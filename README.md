# Connect 4 AI Game

![Game Screenshot](https://github.com/OIEIEIO/Connect4-AI/blob/main/screenshots/Screenshot%202024-07-24%20093554.png)

## Overview
Welcome to the Connect 4 AI Game! This project is a fun and educational tool designed to explore various AI algorithms and their application in gameplay. It provides an environment where users can interact with different AI opponents, understand their strategies, and learn how these algorithms are implemented.

## Game Description
Connect 4 is a classic two-player connection game in which the players take turns dropping colored discs into a vertically suspended grid. The objective is to be the first to form a horizontal, vertical, or diagonal line of four discs.

## AI Opponents
This game includes several AI opponents, each using different algorithms to make decisions. The AI types available are:

1. **Random AI**: This AI makes completely random moves without any strategic planning. It serves as a baseline for comparing more sophisticated AIs.

2. **Minimax AI**: A more advanced algorithm that simulates all possible moves to a certain depth and selects the move that maximizes its chances of winning while minimizing the opponent's chances. Minimax is widely used in game theory and is known for its effectiveness in zero-sum games like Connect 4.

3. **Neural Net AI**: This AI uses a neural network to evaluate board states and decide on the best move. It represents a machine learning approach where the AI learns from previous games and improves its performance over time.

4. **Q-learning AI**: This AI employs a reinforcement learning technique called Q-learning. It learns the value of actions in different states through experience and aims to maximize its total reward. Over time, the Q-learning AI improves its strategy by exploring different moves and learning from the outcomes.

### Disclaimer
At the time of this publish, only the Random and Minimax algorithms are tested and working. The Neural Net and Q-learning algorithms will be tested and this disclaimer will be removed after successful testing.

## Learning Objectives
The primary goal of this project is to demystify AI and show that creating effective AI algorithms is accessible and straightforward. Here’s what you can learn from this project:

- **Understanding AI Algorithms**: Learn how different AI strategies are coded and applied to make game decisions.
- **Hands-on AI Implementation**: Gain practical experience in implementing AI algorithms like Minimax, Neural Networks, and Q-learning.
- **Interactive Learning**: Play against the AI and observe its decision-making process, gaining insights into how AI opponents operate.

## Why Connect 4?
Connect 4 is an excellent choice for this project because:
- **Simplicity**: The rules are straightforward, making it easy to understand and implement AI strategies.
- **Strategic Depth**: Despite its simplicity, Connect 4 offers a rich set of strategies and tactics, providing a meaningful challenge for AI algorithms.
- **Educational Value**: The game's structure allows for clear demonstrations of AI concepts like decision trees, machine learning, and reinforcement learning.

## Future Expansions
There are many ways to expand and enhance this project:
- **Larger Boards**: Increase the board size to add complexity and depth to the game.
- **Additional Features**: Implement new game features such as power-ups, obstacles, or different game modes.
- **Creative AI Uses**: Use the game board as a dot matrix display for messages or art, demonstrating the versatility of AI algorithms.
- **Multiplayer Mode**: Allow multiple human players to play against each other or team up against the AI.

# AI Training and Scoring System for Connect 4

## Benefits of Scoring System for AI

### Reinforcement Learning
- **Reward Mechanism**: In reinforcement learning, agents learn by receiving rewards or penalties based on their actions. A scoring system can serve as a reward mechanism, helping the AI to learn strategies that maximize its score.

### Performance Metrics
- **Tracking Performance**: Tracking scores can provide insights into the AI's performance over time. This can be useful for evaluating different AI strategies or algorithms.

### Training Data
- **Valuable Data**: A scoring system generates valuable training data, which can be used to improve the AI. For example, you can analyze the conditions under which the AI wins, draws, or loses, and use this data to refine its decision-making process.

### Behavior Analysis
- **Pattern Identification**: By analyzing the scores and related game data, you can identify patterns in the AI's behavior. This can help in understanding how the AI responds to different game situations and in making necessary adjustments.

### Adapting Strategies
- **Strategic Adjustments**: The AI can adapt its strategies based on scoring trends. For example, if the AI consistently loses in certain situations, it can adjust its strategy to avoid those scenarios.

## Types of Scoring Data Useful for AI

### Win/Loss/Draw Counts
- **Basic Metrics**: Basic performance metrics indicating how often the AI wins, loses, or draws.

### Point-Based Scores
- **Outcome Points**: Points awarded for different outcomes (e.g., wins, draws, specific patterns). These points can help in fine-tuning the AI's strategy.

### Move-Based Data
- **Efficiency**: Data on the number of moves taken to win or lose. This can help the AI to learn efficient strategies.

### Pattern Recognition
- **Winning Patterns**: Data on winning patterns (e.g., horizontal, vertical, diagonal) can help the AI to recognize and prioritize these patterns during gameplay.

### Game Situations
- **Contextual Data**: Contextual data such as board states, move sequences, and player actions can provide a rich dataset for training and improving the AI.

## Implementing a Scoring System for AI

### Define Scoring Rules
- **Clear Rules**: Establish clear rules for how points are awarded or deducted based on game outcomes and specific in-game events.

### Integrate Scoring with AI Training
- **Training Integration**: Use the scoring data as part of the AI's training process. For example, in a reinforcement learning setup, use the scores as rewards.

### Collect and Analyze Data
- **Continuous Collection**: Continuously collect scoring data and analyze it to identify trends and insights. Use this analysis to refine the AI's algorithms and strategies.

### Feedback Loop
- **Learning Feedback**: Create a feedback loop where the AI learns from its performance and adjusts its strategies based on scoring outcomes.

## Example Scoring System for Connect 4 AI

- **Win**: +3 points
- **Draw**: +1 point
- **Loss**: -1 point
- **Fast Win**: Additional points for winning within fewer moves.
- **Complex Win**: Additional points for winning with more complex patterns (e.g., diagonal wins).

By implementing a scoring system and using the collected data, you can enhance the AI's learning process, leading to improved performance and more sophisticated strategies in Connect 4.

## Best Data for AI Training

The best data for AI training depends on the specific goals and methods used for training. However, for a Connect 4 AI, a combination of various types of data can be highly beneficial. Here are some key types of data that can provide a robust foundation for training an AI:

### Types of Data for AI Training

#### Game State Data
- **Board Configurations**: Captures the state of the board at each move. This includes which player has placed discs in which positions.
- **Move Sequences**: Records the sequence of moves leading to the current board state.

#### Outcome Data
- **Game Results**: Whether the game ended in a win, loss, or draw.
- **Winning Patterns**: Specific patterns that led to a win (e.g., horizontal, vertical, diagonal).

#### Performance Metrics
- **Number of Moves**: How many moves were made by each player before the game ended.
- **Efficiency of Wins**: How quickly the AI wins or loses, indicating the effectiveness of its strategy.

#### Scoring Data
- **Points System**: Points awarded for different game outcomes and actions, as discussed earlier.
- **Scoring Trends**: Analysis of points over multiple games to identify performance trends.

#### Player Action Data
- **Human Moves**: Data on moves made by human players, which can help the AI to learn from human strategies.
- **AI Moves**: Data on moves made by the AI, including the decision-making process and rationale.

#### Contextual Data
- **Game Context**: Information about the game context, such as the current player, remaining moves, and potential future moves.
- **Opponent Behavior**: Patterns and strategies used by opponents, including common moves and tactics.

#### Exploratory Data
- **Exploration vs. Exploitation**: Data on how the AI explores different strategies versus exploiting known successful strategies.
- **Learning Rate Adjustments**: Data on changes in the AI’s learning rate and their impact on performance.

### Sources of Data for AI Training

#### Simulated Games
- **Self-Play**: The AI plays against itself to generate a large amount of training data.
- **Simulation Frameworks**: Use of simulation frameworks to generate diverse game scenarios and outcomes.

#### Human vs. AI Games
- **Recorded Matches**: Data from games played between humans and the AI, providing insights into human strategies and behaviors.
- **Interactive Learning**: Allowing the AI to learn from playing against humans in real-time.

#### Historical Game Data
- **Professional Matches**: Data from professional or high-level Connect 4 matches, if available.
- **Public Databases**: Using publicly available databases of Connect 4 games.

#### Reinforcement Learning Data
- **Reward Signals**: Data on rewards and penalties based on the AI’s actions, used for reinforcement learning.
- **Policy Updates**: Data on policy updates and changes in the AI’s strategy based on rewards.

### Best Practices for Data Collection and Training

#### Data Quality
- **Accuracy and Consistency**: Ensure the data is accurate, consistent, and representative of various game scenarios.

#### Diversity
- **Wide Range of Scenarios**: Collect data from a wide range of game situations, including different opponents and strategies.

#### Balance
- **Mix of Outcomes**: Include a balanced dataset with an appropriate mix of wins, losses, and draws.

#### Real-Time Updates
- **Continuous Learning**: Continuously update the training data with new games and scenarios to keep the AI’s learning current.

#### Feature Engineering
- **Relevant Features**: Extract relevant features from the raw data that can help the AI to learn effectively. This includes board configurations, move sequences, and contextual information.

#### Evaluation
- **Regular Assessment**: Regularly evaluate the AI’s performance using test data and adjust the training process based on the results.

By combining these types of data and following best practices, you can create a comprehensive dataset that enables the AI to learn effectively and improve its performance in Connect 4.


## Conclusion
This project is more than just a game; it's an educational tool designed to make AI accessible and understandable. By exploring the various AI algorithms used in this Connect 4 game, you can gain valuable insights into how AI works and how it can be applied to solve complex problems.

We hope you enjoy playing the game and learning about AI!

## Getting Started
1. Clone the repository.
2. Open the project in Godot Engine.
3. Run the game and start playing against different AI opponents.

## Contributing
Feel free to contribute to this project by improving the AI algorithms, adding new features, or enhancing the game interface. Let's make AI learning fun and interactive!

 
