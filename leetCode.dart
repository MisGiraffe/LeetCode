void main() {
  List<int> nums = [4, 5, 6, 7, 0, 1, 2];
  int target = 3;

  print(search(nums, target));
}

int search(List<int> nums, int target) {
  int result = -1;
  int left = 0;
  int right = nums.length - 1;
  while (left <= right) {
    if (nums[0] == target) {
      return 0;
    } else if (nums[0] > target) {
      if (nums[right] == target) {
        return right;
      }
      right--;
    } else {
      if (nums[left] == target) {
        return left;
      }
      left++;
    }
  }

  return result;
}
