// 12. 整数转罗马数字 https://leetcode.cn/problems/integer-to-roman/

void main() {
  print(intToRoman(1994));
  print(intToRoman(58));
}

String intToRoman(int num) {
  if (num < 1 || num > 3999) {
    return "";
  }
  String result = '';
  int i = 0;
  while (num / 10 > 0) {
    int temp = num % 10;
    int tempResult = num % 10;
    num = num ~/ 10;
    int forNum = 1;
    for (int j = 0; j < i; j++) {
      tempResult = 10 * tempResult;
      forNum = forNum * 10;
    }
    if (tempResult > 0 * forNum && tempResult < 4 * forNum) {
      for (int j = 0; j < temp; j++) {
        result = romanNum(1 * forNum) + result;
      }
    } else if (tempResult == 4 * forNum) {
      result = romanNum(4 * forNum) + result;
    } else if (tempResult == 5) {
      result = romanNum(5 * forNum) + result;
    } else if (tempResult > 4 * forNum && tempResult < 9 * forNum) {
      String aa = romanNum(5 * forNum);
      for (int j = 0; j < (temp - 5); j++) {
        aa = aa + romanNum(1 * forNum);
      }
      result = aa + result;
    } else if (tempResult == 9 * forNum) {
      result = romanNum(9 * forNum) + result;
    }
    i++;
  }
  return result;
}

String romanNum(int num) {
  switch (num) {
    case 1:
      return "I";
    case 4:
      return "IV";
    case 5:
      return "V";
    case 9:
      return "IX";
    case 10:
      return "X";
    case 40:
      return "XL";
    case 50:
      return "L";
    case 90:
      return "XC";
    case 100:
      return "C";
    case 400:
      return "CD";
    case 500:
      return "D";
    case 900:
      return "CM";
    case 1000:
      return "M";
  }
  return "";
}
