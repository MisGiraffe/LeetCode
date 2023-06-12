// 34. 在排序数组中查找元素的第一个和最后一个位置 https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/

void main() {
  List<int> nums = [5, 7, 7, 8, 8, 10];
  int target = 8;
  print(searchRange(nums, target));
}

List<int> searchRange(List<int> nums, int target) {
  List<int> result = [-1, -1];
  int left = 0;
  int right = nums.length - 1;
  if (nums[left] > target || nums[right] < target) {
    return result;
  }
  while (left <= right) {
    if (nums[left] == target && nums[right] == target) {
      return [left, right];
    } else if (nums[left] == target && nums[right] > target) {
      right--;
    } else if (nums[left] < target && nums[right] == target) {
      left++;
    } else {
      right--;
      left++;
    }
  }

  return result;
}
