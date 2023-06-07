// 31. 下一个排列 https://leetcode.cn/problems/next-permutation/

void main() {
  List<int> nums = [1, 3, 2];
  nextPermutation(nums);
}

void nextPermutation(List<int> nums) {
  int i = nums.length - 2;
  while (i >= 0 && nums[i] >= nums[i + 1]) {
    i--;
  }
  if (i >= 0) {
    int j = nums.length - 1;
    while (j >= 0 && nums[i] >= nums[j]) {
      j--;
    }
    _swap(nums, i, j);
  }
  _reverse(nums, i + 1, nums.length - 1);
}

void _swap(List<int> nums, int i, int j) {
  int temp = nums[i];
  nums[i] = nums[j];
  nums[j] = temp;
}

void _reverse(List<int> nums, int left, int right) {
  while (left < right) {
    int temp = nums[left];
    nums[left] = nums[right];
    nums[right] = temp;
    left++;
    right--;
  }
}
