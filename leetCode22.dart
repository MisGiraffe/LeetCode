// 22. 括号生成 https://leetcode.cn/problems/generate-parentheses

void main() {
  int n = 3;
  print(generateParenthesis(n));
}

var result = <String>[];
List<String> generateParenthesis(int n) {
  dfs(n, 0, 0, "");
  return result;
}

void dfs(int n, int left, int right, String str) {
  // 字符串数量==2*n，递归结束
  if (str.length == 2 * n) {
    return result.add(str);
  }

  // 左括号拼接小于n，拼接左括号
  if (left < n) {
    str += '(';
    dfs(n, left + 1, right, str);
    str = str.substring(0, str.length - 1);
  }
  // 如果右括号拼接的数量小于左括号拼接的数量，拼接右括号
  if (right < left) {
    str += ')';
    dfs(n, left, right + 1, str);
    str = str.substring(0, str.length - 1);
  }
}
