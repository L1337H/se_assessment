void main() {
  calculateNumberOfBombsInNeighbourhood();
}

List output = [[], [], [], []];

List board = [
  [".", ".", "*", "."],
  [".", ".", ".", "."],
  [".", "*", ".", "."],
  [".", ".", ".", "."]
];

calculateNumberOfBombsInNeighbourhood() {
  for (var row = 0; row < board.length; row++) {
    for (var entry = 0; entry < board[row].length; entry++) {
      //if mine
      if (board[row][entry] == "*") {
        output[row].add("*");
      } else {
        output[row].add(0);
        calculateOutputEntry(row, entry);
      }
    }
  }

  print(output);
}

calculateOutputEntry(row, entry) {
  if (!checkIfEntryIsEnd(entry)) {
    //front
    if (board[row][entry + 1] == "*") {
      incrementOutputEntry(row, entry);
    }
    if (!checkIfEntryIsBottom(row)) {
      //down right
      if (board[row + 1][entry + 1] == "*") {
        incrementOutputEntry(row, entry);
      }
    }
    if (!checkIfEntryIsTop(row)) {
      //up right
      if (board[row - 1][entry + 1] == "*") {
        incrementOutputEntry(row, entry);
      }
    }
  }
  if (!checkIfEntryIsBeginning(entry)) {
    //behind
    if (board[row][entry - 1] == "*") {
      incrementOutputEntry(row, entry);
    }
    if (!checkIfEntryIsTop(row)) {
      // up left
      if (board[row - 1][entry - 1] == "*") {
        incrementOutputEntry(row, entry);
      }
    }
    if (!checkIfEntryIsBottom(row)) {
      //down left
      if (board[row + 1][entry - 1] == "*") {
        incrementOutputEntry(row, entry);
      }
    }
  }

  if (!checkIfEntryIsTop(row)) {
    //straight up
    if (board[row - 1][entry] == "*") {
      incrementOutputEntry(row, entry);
    }
  }

  if (!checkIfEntryIsBottom(row)) {
    //straight down
    if (board[row + 1][entry] == "*") {
      incrementOutputEntry(row, entry);
    }
  }
}

incrementOutputEntry(row, entry) {
  output[row][entry] += 1;
}

bool checkIfEntryIsTop(int row) {
  if (row == 0) {
    return true;
  } else {
    return false;
  }
}

bool checkIfEntryIsBottom(int row) {
  if (row == board.length - 1) {
    return true;
  } else {
    return false;
  }
}

bool checkIfEntryIsBeginning(int entry) {
  if (entry == 0) {
    return true;
  } else {
    return false;
  }
}

bool checkIfEntryIsEnd(int entry) {
  if (entry == board[0].length - 1) {
    return true;
  } else {
    return false;
  }
}
