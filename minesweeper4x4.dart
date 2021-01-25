void main() {
  calculateNumberOfBombsInNeighbourhood() {
    List output = [[], [], [], []];

    List board = [
      [".", ".", "*", "."],
      [".", ".", ".", "."],
      [".", "*", ".", "."],
      [".", ".", ".", "."]
    ];
    for (var row = 0; row < board.length; row++) {
      for (var entry = 0; entry < board[row].length; entry++) {
        //if mine
        if (board[row][entry] == "*") {
          output[row].add("*");
        } else {
          output[row].add(0);
          if (entry < 3) {
            //front
            if (board[row][entry + 1] == "*") {
              output[row][entry] += 1;
            }
            if (row != 3) {
              //down right
              if (board[row + 1][entry + 1] == "*") {
                output[row][entry] += 1;
              }
            }
            if (row != 0) {
              //up right
              if (board[row - 1][entry + 1] == "*") {
                output[row][entry] += 1;
              }
            }
          }
          if (entry > 0) {
            //behind
            if (board[row][entry - 1] == "*") {
              output[row][entry] += 1;
            }
            if (row != 0) {
              // up left
              if (board[row - 1][entry - 1] == "*") {
                output[row][entry] += 1;
              }
            }
            if (row != 3) {
              //down left
              if (board[row + 1][entry - 1] == "*") {
                output[row][entry] += 1;
              }
            }
          }

          if (row != 0) {
            //straight up
            if (board[row - 1][entry] == "*") {
              output[row][entry] += 1;
            }
          }

          if (row != 3) {
            //straight down
            if (board[row + 1][entry] == "*") {
              output[row][entry] += 1;
            }
          }
        }
      }
    }

    print(output);
  }

  calculateNumberOfBombsInNeighbourhood();
}
