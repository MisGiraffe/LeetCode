// 15. 三数之和 https://leetcode.cn/problems/3sum

void main() {
  List<int> nums = [-1, 0, 1, 2, -1, -4];
  // nums = [0, 1, 1];
  print(threeSum(nums));
}

List<List<int>> threeSum(List<int> nums) {
  List<List<int>> result = [];
  nums.sort();
  for (int i = 0; i < nums.length; i++) {
    int left = i + 1;
    int right = nums.length - 1;
    while (left < right) {
      if (nums[i] + nums[left] + nums[right] == 0) {
        if (!isContains(result, [nums[i], nums[left], nums[right]])) {
          result.add([nums[i], nums[left], nums[right]]);
        }
        left++;
        right--;
      } else if (nums[i] + nums[left] + nums[right] > 0) {
        right--;
      } else {
        left++;
      }
    }
  }
  return result;
}

bool isContains(List<List<int>> result, List<int> temp) {
  for (int i = 0; i < result.length; i++) {
    List<int> tempList = result[i];
    if (tempList[0] == temp[0] &&
        tempList[1] == temp[1] &&
        tempList[2] == temp[2]) {
      return true;
    }
  }
  return false;
}
