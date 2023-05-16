//  4. 寻找两个正序数组的中位数 https://leetcode.cn/problems/median-of-two-sorted-arrays
void main() {
  List<int> nums1 = [];
  List<int> nums2 = [3];
  print(findMedianSortedArrays(nums1, nums2));
}

double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  if (nums1.length == 0 && nums2.length == 0) {
    return 0;
  }
  int middleInt = ((nums1.length + nums2.length) / 2).ceil();
  int forNum = 0;
  if ((nums1.length + nums2.length) % 2 == 0) {
    forNum = middleInt + 1;
  } else {
    forNum = middleInt;
  }
  int i = 0;
  int j = 0;
  List<int> milddleList = [];
  while (i + j < forNum) {
    if (i >= nums1.length) {
      milddleList.add(nums2[j]);
      j++;
      continue;
    }
    if (j >= nums2.length) {
      milddleList.add(nums1[i]);
      i++;
      continue;
    }
    if (nums1[i] < nums2[j]) {
      milddleList.add(nums1[i]);
      i++;
    } else {
      milddleList.add(nums2[j]);
      j++;
    }
  }
  // 判断是奇数个还是偶数个
  if ((nums1.length + nums2.length) % 2 == 0) {
    return (milddleList[middleInt - 1] + milddleList[middleInt]) / 2;
  } else {
    return milddleList[middleInt - 1].toDouble();
  }
}
