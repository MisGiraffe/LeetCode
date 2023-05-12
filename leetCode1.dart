import 'dart:core';

void main() {
  print('ftttttt');
  List<int> nums = [2, 7, 11, 15];
  int target = 9;
  print(twoSum(nums, target));
}

List<int> twoSum(List<int> nums, int target) {
  Map<int, int> totalNum = new Map();
  for (int i = 0; i < nums.length; i++) {
    if (totalNum.containsKey(target - nums[i])) {
      List<int> result = [i, totalNum[target - nums[i]] ?? 0];
      return (result);
    } else {
      totalNum[nums[i]] = i;
    }
  }
  return [];
}
