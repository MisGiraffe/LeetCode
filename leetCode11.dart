// 11. 盛最多水的容器  https://leetcode.cn/problems/container-with-most-water

import 'dart:math';

void main() {
  List<int> height = [1, 8, 6, 2, 5, 4, 8, 3, 7];
  print(maxArea(height));
}

int maxArea(List<int> height) {
  int maxWater = 0;
  int left = 0;
  int right = height.length - 1;
  while (left < right) {
    int waterHeight = min(height[left], height[right]);
    maxWater = max(maxWater, (right - left) * waterHeight);
    if (left < right && height[left] > height[right]) {
      right--;
    } else if (left < right && height[left] <= height[right]) {
      left++;
    }
  }
  return maxWater;
}

// 暴力破解
int maxArea2(List<int> height) {
  int maxWater = 0;
  for (int i = 0; i < height.length - 1; i++) {
    for (int j = i + 1; j < height.length; j++) {
      int waterHeight = min(height[i], height[j]);
      int water = waterHeight * (j - i);
      maxWater = max(water, maxWater);
    }
  }
  return maxWater;
}
