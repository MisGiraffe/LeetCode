// 27. 移除元素 https://leetcode.cn/problems/remove-element
void main() {
  List<int> nums = [0, 1, 2, 2, 3, 0, 4, 2];
  int val = 2;
  print(removeElement(nums, val));
}

int removeElement(List<int> nums, int val) {
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == val) {
      nums.removeAt(i);
      i--;
    }
  }
  return nums.length;
}
