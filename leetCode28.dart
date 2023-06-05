// 28. 找出字符串中第一个匹配项的下标 https://leetcode.cn/problems/find-the-index-of-the-first-occurrence-in-a-string/
void main() {
  String haystack = "hello";
  String needle = "ll";
  print(strStr(haystack, needle));
}

int strStr(String haystack, String needle) {
  if (haystack.length == 0 && needle.length == 0) {
    return -1;
  }
  int temp = 0;
  for (int i = 0; i < haystack.length; i++) {
    if (haystack[i] != needle[temp]) {
      i = i - temp;
      temp = 0;
      continue;
    }
    if (temp == needle.length - 1) {
      return i - temp;
    }
    temp++;
  }

  return -1;
}
