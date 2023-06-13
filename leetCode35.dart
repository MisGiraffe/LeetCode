// 35. 搜索插入位置 https://leetcode.cn/problems/search-insert-position/

void main(List<String> args) {
  List<int> nums = [1, 3, 5, 6];
  int target = 2;
  print(searchInsert(nums, target));
}

int searchInsert(List<int> nums, int target) {
  int left = 0;
  int right = nums.length - 1;
  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    if (nums[mid] == target) {
      return mid;
    } else if (nums[mid] > target) {
      right--;
    } else {
      left++;
    }
  }
  return right + 1;
}
