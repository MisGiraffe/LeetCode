// 16. 最接近的三数之和 https://leetcode.cn/problems/3sum-closest

void main() {
  List<int> nums = [4, 0, 5, -5, 3, 3, 0, -4, -5];
  int target = -2;
  // nums = [1, 1, 1, 0];
  // target = -100;
  print(threeSumClosest(nums, target));
}

int threeSumClosest(List<int> nums, int target) {
  nums.sort();
  int result = nums[0] + nums[1] + nums[2];
  for (int i = 0; i < nums.length - 2; i++) {
    int left = i + 1;
    int right = nums.length - 1;
    while (left < right) {
      int closeNum = nums[i] + nums[left] + nums[right];
      if ((closeNum - target).abs() < (result - target).abs()) {
        result = closeNum;
      }
      if (closeNum > target) {
        right--;
      } else if (closeNum < target) {
        left++;
      } else {
        return target;
      }
    }
  }
  return result;
}
