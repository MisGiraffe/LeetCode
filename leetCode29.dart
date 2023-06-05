void main() {
  int dividend = -2147483648;
  int divisor = 1;
  print(divide(dividend, divisor));
}

int divide(int dividend, int divisor) {
  int sign = 1;
  if ((dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)) {
    sign = -1;
  }
  dividend = dividend.abs();
  divisor = divisor.abs();
  int result = 1;
  while (dividend >= divisor) {
    int number = 1;
    int temp = divisor;
    while (dividend >= temp) {
      result += number;
      if (sign * result < 0 - (1 << 31)) {
        return 0 - (1 << 31);
      }
      if (sign * result > (1 << 31) - 1) {
        return (1 << 31) - 1;
      }
      dividend -= temp;
      number <<= 1;
      temp <<= 1;
    }
  }
  return (result - 1) * sign;
}
