// 5.最长回文子串 https://leetcode.cn/problems/longest-palindromic-substring

void main() {
  print(longestPalindrome('cbbd'));
}

String longestPalindrome(String s) {
  if (s.length == 0) {
    return "";
  }
  int maxlen = 1;
  int startNum = 0;
  for (int i = 0; i < s.length; i++) {
    for (int j = i + maxlen; j < s.length; j++) {
      if (judge(s, i, j)) {
        startNum = i;
        maxlen = j - i + 1;
      }
    }
  }
  return s.substring(startNum, startNum + maxlen);
}

bool judge(String s, int i, int j) {
  while (i < j) {
    if (s[i] != s[j]) {
      return false;
    }
    i++;
    j--;
  }
  return true;
}
