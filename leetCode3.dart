import 'dart:math';

void main() {
  print(lengthOfLongestSubstring('pwwkew'));
}

int lengthOfLongestSubstring(String s) {
  if (s.length < 0) {
    return 0;
  }

  int strLongNum = 0;
  int i = 0;
  int j = 0;
  while (j < s.length) {
    if (s.substring(i, j).contains(s[j])) {
      i++;
    } else {
      j++;
    }
    strLongNum = max(strLongNum, j - i);
  }
  return strLongNum;
}
