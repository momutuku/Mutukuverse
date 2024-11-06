import 'dart:math';

class TicTacToeGame {
  List<String> board = List.filled(9, '');
  bool isPlayerTurn = true;
  bool isComputerOpponent;
  String? winner;

  TicTacToeGame({this.isComputerOpponent = false});

  void makeMove(int index) {
    if (board[index] == '' && !isGameOver()) {
      board[index] = isPlayerTurn ? 'X' : 'O';
      if (isGameOver()) return;
      isPlayerTurn = !isPlayerTurn;
      if (isComputerOpponent && !isPlayerTurn) {
        makeComputerMove();
      }
    }
  }

  void makeComputerMove() {
    List<int> emptySpots = [];
    for (int i = 0; i < 9; i++) {
      if (board[i] == '') {
        emptySpots.add(i);
      }
    }
    if (emptySpots.isNotEmpty) {
      final random = Random();
      int computerMove = emptySpots[random.nextInt(emptySpots.length)];
      makeMove(computerMove);
    }
  }

  bool isGameOver() {
    // Check rows, columns, and diagonals
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != '' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2]) {
        winner = board[i * 3];
        return true;
      }
      if (board[i] != '' &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        winner = board[i];
        return true;
      }
    }
    if (board[0] != '' && board[0] == board[4] && board[0] == board[8]) {
      winner = board[0];
      return true;
    }
    if (board[2] != '' && board[2] == board[4] && board[2] == board[6]) {
      winner = board[2];
      return true;
    }
    if (!board.contains('')) {
      winner = 'Draw';
      return true;
    }
    return false;
  }

  String getWinnerMessage() {
    if (winner == 'Draw') {
      return "It's a draw!";
    } else if (winner != null) {
      return "Player $winner wins!";
    }
    return '';
  }

  void resetGame() {
    board = List.filled(9, '');
    isPlayerTurn = true;
    winner = null;
  }
}
