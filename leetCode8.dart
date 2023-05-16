// 8. 字符串转换整数 (atoi) https://leetcode.cn/problems/string-to-integer-atoi/
import 'dart:math';

void main() {
  // String text = "b";

  // print(text.compareTo('a')); // b>a，返回 1
  // print(text.compareTo('b')); // b=b，返回 0
  // print(text.compareTo('c')); // b<c，返回 -1
  // print(text.compareTo('7')); // 字母在数字后面，返回 1
  // print(text.compareTo('B')); // 小写字母在大写字母后面，返回 1
  print(myAtoi("42"));
}

int myAtoi(String s) {
  int result = 0;
  int isNegative = 1;
  String startNum = '0';
  String endNum = '9';
  final max = 2147483647;
  final min = -2147483648;
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '-') {
      isNegative = -1;
      if (!judgeNum(s, i + 1)) {
        break;
      }
    } else if (s[i] == '+') {
      isNegative = 1;
      if (!judgeNum(s, i + 1)) {
        break;
      }
    } else if (s[i] == ' ') {
      continue;
    } else if (judgeNum(s, i)) {
      result = result * 10 + int.parse(s[i]);
      if (result > max && isNegative == 1) {
        return max;
      }
      if (result * isNegative < min && isNegative == -1) {
        return min;
      }
      if (!judgeNum(s, i + 1)) {
        break;
      }
    } else {
      break;
    }
  }
  return result * isNegative;
}

bool judgeNum(String s, int i) {
  String startNum = '0';
  String endNum = '9';
  if (i >= s.length) {
    return false;
  }
  if ((startNum.compareTo(s[i]) == -1 && endNum.compareTo(s[i]) == 1) ||
      startNum.compareTo(s[i]) == 0 ||
      endNum.compareTo(s[i]) == 0) {
    return true;
  } else {
    return false;
  }
}
