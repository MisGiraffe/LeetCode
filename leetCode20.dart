// 20. 有效的括号 https://leetcode.cn/problems/valid-parentheses/

void main() {
  String s = "()[]{}";
  s = "()([]{})";
  print(isValid(s));
}

bool isValid(String s) {
  var stack = <String>[];
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(') {
      stack.add(')');
    } else if (s[i] == '[') {
      stack.add(']');
    } else if (s[i] == '{') {
      stack.add('}');
    } else if (stack.isEmpty || s[i] != stack.last) {
      return false;
    } else {
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}
