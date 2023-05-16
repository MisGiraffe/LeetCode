// 6.N 字形变换 https://leetcode.cn/problems/zigzag-conversion/

void main() {
  print(convert('PAYPALISHIRING', 2));
}

String convert(String s, int numRows) {
  if (s.length == 0) {
    return "";
  }
  if (numRows == 1) {
    return s;
  }
  String result = '';
  for (int i = 0; i < numRows; i++) {
    result = result + returnStr(s, i, numRows);
  }
  return result;
}

String returnStr(String s, int i, int numRows) {
  int j = i;
  String resultLine = "";
  while (j < s.length) {
    if (i == 0 || i == numRows - 1) {
      resultLine = resultLine + s[j];
      j = j + (2 * numRows) - 2;
    } else {
      resultLine = resultLine + s[j];
      int nextNum = j + (numRows - i - 1) * 2;
      if (nextNum < s.length) {
        resultLine = resultLine + s[nextNum];
      }
      j = j + (2 * numRows) - 2;
    }
  }
  return resultLine;
}
