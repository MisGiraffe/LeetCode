// 7. 整数反转
void main() {
  print(reverse(1534236469));
}

int reverse(int x) {
  int result = 0;
  int isNegative = 1;
  if (x < 0) {
    x = x * -1;
    isNegative = -1;
  }
  while (x / 10 != 0) {
    result = result * 10 + x % 10;
    x = x ~/ 10;
  }

  if (result > 2147483648) {
    return 0;
  }
  return result * isNegative;
}
