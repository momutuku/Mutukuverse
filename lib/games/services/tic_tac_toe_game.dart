import 'dart:math';

class TicTacToeGame {
  List<String> board = List.filled(9, '');
  bool isPlayerTurn = true;
  Random random = Random();

  bool makeMove(int index) {
    if (board[index] == '' && !isGameOver()) {
      board[index] = isPlayerTurn ? 'X' : 'O';
      isPlayerTurn = !isPlayerTurn;
      return true;
    }
    return false;
  }

  void makeComputerMove() {
    List<int> emptyCells = [];
    for (int i = 0; i < 9; i++) {
      if (board[i] == '') emptyCells.add(i);
    }
    if (emptyCells.isNotEmpty) {
      int randomIndex = random.nextInt(emptyCells.length);
      makeMove(emptyCells[randomIndex]);
    }
  }

  bool isGameOver() {
    // Check rows, columns, and diagonals
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != '' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2]) return true;
      if (board[i] != '' &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) return true;
    }
    if (board[0] != '' && board[0] == board[4] && board[0] == board[8]) return true;
    if (board[2] != '' && board[2] == board[4] && board[2] == board[6]) return true;

    // Check for a draw
    return !board.contains('');
  }

  String getWinner() {
    // Check rows, columns, and diagonals
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != '' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2]) return board[i * 3];
      if (board[i] != '' &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) return board[i];
    }
    if (board[0] != '' && board[0] == board[4] && board[0] == board[8]) return board[0];
    if (board[2] != '' && board[2] == board[4] && board[2] == board[6]) return board[2];

    return '';
  }
}
