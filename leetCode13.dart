// 13. 罗马数字转整数 https://leetcode.cn/problems/roman-to-integer
void main() {
  print(romanToInt("III"));
  print(romanToInt("IV"));
  print(romanToInt("LVIII"));
  print(romanToInt("MCMXCIV"));
}

int romanToInt(String s) {
  int result = 0;
  for (int i = s.length - 1; i >= 0; i--) {
    if (i - 1 >= 0 && numRoman(s[i]) > numRoman(s[i - 1])) {
      result = result + numRoman(s.substring(i - 1, i + 1));
      i--;
    } else {
      result = result + numRoman(s[i]);
    }
  }
  return result;
}

int numRoman(String s) {
  switch (s) {
    case "I":
      return 1;
    case "IV":
      return 4;
    case "V":
      return 5;
    case "IX":
      return 9;
    case "X":
      return 10;
    case "XL":
      return 40;
    case "L":
      return 50;
    case "XC":
      return 90;
    case "C":
      return 100;
    case "CD":
      return 400;
    case "D":
      return 500;
    case "CM":
      return 900;
    case "M":
      return 1000;
  }
  return 0;
}
