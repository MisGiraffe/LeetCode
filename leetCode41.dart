// 41. 缺失的第一个正数 https://leetcode.cn/problems/first-missing-positive/
void main(List<String> args) {
  List<int> nums = [7, 8, 9, 11, 12];
  print(firstMissingPositive(nums));
}

int firstMissingPositive(List<int> nums) {
  Set<int> hashSet = Set();
  for (int i = 0; i < nums.length; i++) {
    hashSet.add(nums[i]);
  }
  print(hashSet);
  for (int i = 1; i <= nums.length; i++) {
    if (!hashSet.contains(i)) {
      return i;
    }
  }

  return nums.length + 1;
}
