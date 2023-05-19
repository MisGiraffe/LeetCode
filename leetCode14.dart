// 14. 最长公共前缀 https://leetcode.cn/problems/longest-common-prefix

void main() {
  List<String> strs = ["flower", "flow", "flight"];
  strs = ["ab", "a"];
  print(longestCommonPrefix(strs));
}

String longestCommonPrefix(List<String> strs) {
  String result = "";
  if (strs.length == 0) {
    return "";
  }
  if (strs.length == 1) {
    return strs[0];
  }
  for (int i = 0; i < strs[0].length; i++) {
    int temp = 0;
    for (int j = 1; j < strs.length; j++) {
      String strOne = strs[0];
      String strNum = strs[j];
      if (i < strNum.length && strOne[i] == strNum[i]) {
        if (temp == strs.length - 2) {
          result = result + strOne[i];
        }
        temp++;
      } else {
        return result;
      }
    }
  }
  return result;
}
