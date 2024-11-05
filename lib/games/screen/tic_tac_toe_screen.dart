import 'package:flutter/material.dart';
import 'package:game_challenge/games/services/tic_tac_toe_game.dart';

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late TicTacToeGame game;

  @override
  void initState() {
    super.initState();
    game = TicTacToeGame();
  }

  void _handleCellTap(int index) {
    if (game.makeMove(index)) {
      setState(() {});
      if (!game.isGameOver() && !game.isPlayerTurn) {
        game.makeComputerMove();
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _handleCellTap(index),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text(
                      game.board[index],
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            game.isGameOver()
                ? game.getWinner() != ''
                    ? '${game.getWinner()} wins!'
                    : 'It\'s a draw!'
                : 'Current turn: ${game.isPlayerTurn ? 'Player' : 'Computer'}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                game = TicTacToeGame();
              });
            },
            child: Text('Restart Game'),
          ),
        ],
      ),
    );
  }
}
