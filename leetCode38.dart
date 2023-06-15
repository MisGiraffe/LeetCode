// 38. 外观数列 https://leetcode.cn/problems/count-and-say/

void main(List<String> args) {
  print(countAndSay(4));
}

String countAndSay(int n) {
  String preStr = "1";
  for (int i = 2; i <= n; i++) {
    int pos = 0;
    int start = 0;
    String curStr = "";
    while (pos < preStr.length) {
      while (pos < preStr.length && preStr[pos] == preStr[start]) {
        // print("n: ${n} pos: ${pos}");
        pos++;
      }
      curStr += (pos - start).toString() + preStr[start];
      start = pos;
    }
    preStr = curStr;
    // print("preStr ${preStr}");
  }
  return preStr;
}
