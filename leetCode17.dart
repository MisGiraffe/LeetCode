// 17. 电话号码的字母组合 https://leetcode.cn/problems/letter-combinations-of-a-phone-number

void main() {
  String digits = '23';
  print(letterCombinations(digits));
}

List<String> letterCombinations(String digits) {
  if (digits.length <= 0) {
    return [];
  }
  List<String> result = [];

  String letters = numWithLetter(digits[0]);
  List<String> temp = [];
  for (int i = 0; i < letters.length; i++) {
    result.add(letters[i]);
  }
  for (int i = 1; i < digits.length; i++) {
    temp.clear();
    temp.addAll(result);
    letters = numWithLetter(digits[i]);
    result.clear();
    for (int j = 0; j < temp.length; j++) {
      for (int k = 0; k < letters.length; k++) {
        String strLetters = temp[j] + letters[k];
        result.add(strLetters);
      }
    }
  }
  return result;
}

String numWithLetter(String numStr) {
  switch (numStr) {
    case "2":
      return "abc";
    case "3":
      return "def";
    case "4":
      return "ghi";
    case "5":
      return "jkl";
    case "6":
      return "mno";
    case "7":
      return "pqrs";
    case "8":
      return "tuv";
    case "9":
      return "wxyz";
  }
  return "";
}
