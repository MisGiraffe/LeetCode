// 18. 四数之和 https://leetcode.cn/problems/4sum/

void main() {
  List<int> nums = [1, 0, -1, 0, -2, 2];
  int target = 0;
  nums = [2, 2, 2, 2, 2];
  target = 8;
  print(fourSum(nums, target));
}

List<List<int>> fourSum(List<int> nums, int target) {
  List<List<int>> result = [];
  nums.sort();
  for (int i = 0; i < nums.length - 3; i++) {
    int tempTarget = target - nums[i];
    for (int j = i + 1; j < nums.length - 2; j++) {
      int left = j + 1;
      int right = nums.length - 1;
      while (left < right) {
        int tempResult = nums[j] + nums[left] + nums[right];
        // print(
        //     'nums[i]${nums[i]}, nums[j]${nums[j]}, nums[left]${nums[left]}, nums[right]${nums[right]}');
        if (tempResult == tempTarget) {
          List<int> item = [nums[i], nums[j], nums[left], nums[right]];
          if (!isSame(result, item)) {
            result.add(item);
          }
          left++;
          right--;
        } else if (tempResult > tempTarget) {
          right--;
        } else {
          left++;
        }
      }
    }
  }
  return result;
}

bool isSame(List<List<int>> result, List<int> item) {
  for (int i = 0; i < result.length; i++) {
    List<int> temp = result[i];
    if (temp[0] == item[0] &&
        temp[1] == item[1] &&
        temp[2] == item[2] &&
        temp[3] == item[3]) {
      return true;
    }
  }
  return false;
}
