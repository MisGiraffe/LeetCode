// 10. 正则表达式匹配  https://leetcode.cn/problems/regular-expression-matching/

void main() {
  // print(isMatch('aab', 'c*a*b')); // true
  // print(isMatch('aa', 'a*')); // true
  print(isMatch('mississippi', 'mis*is*p*.')); // false
  // print(isMatch('mississippi', 'mis*is*p*')); // false
  // print(isMatch('ab', 'ab'));
  // print(isMatch('aaa', 'a*a'));
}

bool isMatch(String s, String p) {
  int sLength = s.length;
  int pLength = p.length;
  var dp = <List<bool>>[];
  // 初始化dp
  for (int i = 0; i <= sLength; i++) {
    dp.add(<bool>[]);
    for (int j = 0; j <= pLength; j++) {
      dp[i].add(false);
    }
  }
  dp[0][0] = true;
  for (int j = 2; j <= pLength; j += 2) {
    dp[0][j] = dp[0][j - 2] && p[j - 1] == '*';
  }
  for (int i = 1; i <= sLength; i++) {
    for (int j = 1; j <= pLength; j++) {
      if (p[j - 1] == '*') {
        if (dp[i][j - 2]) {
          dp[i][j] = true;
        } else if (dp[i - 1][j] && s[i - 1] == p[j - 2]) {
          dp[i][j] = true;
        } else if (dp[i - 1][j] && p[j - 2] == '.') {
          dp[i][j] = true;
        }
      } else {
        if (dp[i - 1][j - 1] && s[i - 1] == p[j - 1]) {
          dp[i][j] = true;
        } else if (dp[i - 1][j - 1] && p[j - 1] == '.') {
          dp[i][j] = true;
        }
      }
    }
  }
  return dp[sLength][pLength];
}

// 递归
bool isMatch1(String s, String p) {
  if (p.isEmpty) {
    return s.isEmpty;
  }
  bool firstMatch = s.isNotEmpty && (p[0] == s[0] || p[0] == '.');
  if (p.length >= 2 && p[1] == '*') {
    return (isMatch1(s, p.substring(2)) ||
        (firstMatch && isMatch1(s.substring(1), p)));
  } else {
    return firstMatch && isMatch1(s.substring(1), p.substring(1));
  }
}
