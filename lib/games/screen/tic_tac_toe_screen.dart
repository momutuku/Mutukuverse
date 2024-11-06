import 'package:flutter/material.dart';

import '../services/tic_tac_toe_game.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({Key? key}) : super(key: key);

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late TicTacToeGame game;
  bool? isComputerOpponent;

  @override
  void initState() {
    super.initState();
    game = TicTacToeGame();
  }

  void _onCellTap(int index) {
    if (isComputerOpponent == null) return;
    setState(() {
      game.makeMove(index);
    });
  }

  Widget _buildCell(int index) {
    return GestureDetector(
      onTap: () => _onCellTap(index),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            game.board[index],
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }

  Widget _buildGameModeSelection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Game Mode',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isComputerOpponent = false;
                game = TicTacToeGame(isComputerOpponent: false);
              });
            },
            child: Text('Two Players'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isComputerOpponent = true;
                game = TicTacToeGame(isComputerOpponent: true);
              });
            },
            child: Text('Play Against Computer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: isComputerOpponent == null
          ? _buildGameModeSelection()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) => _buildCell(index),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  game.isGameOver()
                      ? game.getWinnerMessage()
                      : 'Current turn: ${game.isPlayerTurn ? 'Player X' : 'Player O'}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      game.resetGame();
                    });
                  },
                  child: const Text('Reset Game'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isComputerOpponent = null;
                    });
                  },
                  child: const Text('Change Game Mode'),
                ),
              ],
            ),
    );
  }
}
