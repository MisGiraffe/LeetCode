// 26. 删除有序数组中的重复项  https://leetcode.cn/problems/remove-duplicates-from-sorted-array/

void main() {
  List<int> nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
  print(removeDuplicates(nums));
}

int removeDuplicates(List<int> nums) {
  for (int i = 0; i < nums.length - 1; i++) {
    if (nums[i] == nums[i + 1]) {
      nums.removeAt(i + 1);
      i--;
    }
  }
  return nums.length;
}
