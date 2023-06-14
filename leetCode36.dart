// 36. 有效的数独 https://leetcode.cn/problems/valid-sudoku/

void main(List<String> args) {
  List<List<String>> board = [
    ["3", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];
  print(isValidSudoku(board));
}

List<List<int>> initList() {
  List<List<int>> initList = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];
  return initList;
}

bool isValidSudoku(List<List<String>> board) {
  List<List<int>> row = initList();
  List<List<int>> cloum = initList();
  List<List<int>> subSudoKu = initList();
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      String char = board[i][j];
      if (char == '.') {
        continue;
      }
      int currentNum = int.parse(char);
      if (row[i][currentNum] > 0) {
        return false;
      }
      if (cloum[j][currentNum] > 0) {
        return false;
      }
      if (subSudoKu[j ~/ 3 + (i ~/ 3) * 3][currentNum] > 0) {
        return false;
      }
      row[i][currentNum] = 1;
      cloum[j][currentNum] = 1;
      subSudoKu[j ~/ 3 + (i ~/ 3) * 3][currentNum] = 1;
    }
  }
  return true;
}
