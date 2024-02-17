import 'dart:io';

void main() {
  // Initialize the game board
  List<List<String>> board = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' '],
  ];

  // Initialize the current player
  String currentPlayer = 'X';

  // Play the game until it is won or tied
  while (!isGameOver(board)) {
    // Ask the current player to make a move
    print('Player $currentPlayer, make your move (row column):');
    String? input = stdin.readLineSync();
    if (input == null) {
      print('Invalid input, try again.');
      continue;
    }
    List<String> move = input.split(' ');

    // Validate the move
    if (move.length != 2) {
      print('Invalid input, try again.');
      continue;
    }
    int? row = int.tryParse(move[0]);
    int? col = int.tryParse(move[1]);
    if (row == null || col == null || row < 1 || row > 3 || col < 1 || col > 3 || board[row - 1][col - 1] != ' ') {
      print('Invalid move, try again.');
      continue;
    }

    // Update the game board
    board[row - 1][col - 1] = currentPlayer;

    // Display the updated game board
    printBoard(board);

    // Check if the game is over
    if (isGameOver(board)) {
      break;
    }

    // Switch to the next player
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }

  // Display the result of the game
  if (isGameWon(board)) {
    print('Player $currentPlayer wins!');
  } else {
    print('Tie game!');
  }
}

// Display the game board
void printBoard(List<List<String>> board) {
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      stdout.write(board[row][col]);
      if (col < 2) {
        stdout.write('|');
      }
    }
    print('');
    if (row < 2) {
      print('-----');
    }
  }
}

// Check if the game is over
bool isGameOver(List<List<String>> board) {
  return isGameWon(board) || isGameTied(board);
}

// Check if the game has been won
bool isGameWon(List<List<String>> board) {
  // Check rows
  for (int row = 0; row < 3; row++) {
    if (board[row][0] != ' ' && board[row][0] == board[row][1] && board[row][1] == board[row][2]) {
      return true;
    }
  }

  // Check columns
  for (int col = 0; col < 3; col++) {
    if (board[0][col] != ' ' && board[0][col] == board[1][col] && board[1][col] == board[2][col]) {
      return true;
    }
  }

  // Check diagonals
  if (board[0][0] != ' ' && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
    return true;
  }
  if (board[0][2] != ' ' && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
    return true;
  }

  // Game is not won
  return false;
}

// Check if the game is tied
bool isGameTied(List<List<String>> board) {
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      if (board[row][col] == ' ') {
        return false;
      }
    }
  }
  return true;
}
