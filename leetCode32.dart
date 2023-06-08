// 32. 最长有效括号 https://leetcode.cn/problems/longest-valid-parentheses/

import 'dart:math';

void main() {
  String s = ")()(()";
  print(longestValidParentheses(s));
}

int longestValidParentheses(String s) {
  int result = 0;
  if (s.length == 0) {
    return result;
  }
  List<int> temp = [];
  temp.add(-1);
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(') {
      temp.add(i);
    } else {
      temp.removeLast();
      if (temp.isEmpty) {
        temp.add(i);
      } else {
        result = max(result, i - temp[temp.length - 1]);
      }
    }
  }
  return result;
}
