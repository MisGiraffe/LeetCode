// 9. 回文数 https://leetcode.cn/problems/palindrome-number

void main() {
  print(isPalindrome(121));
}

bool isPalindrome(int x) {
  if (x < 0) {
    return false;
  }
  String str = x.toString();
  for (int i = 0; i < (str.length / 2); i++) {
    if (str[i] != str[str.length - 1 - i]) {
      return false;
    }
  }
  return true;
}
