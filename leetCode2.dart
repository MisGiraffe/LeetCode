//  2. 两数相加 https://leetcode.cn/problems/add-two-numbers/
import 'dart:core';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void main() {
  ListNode? l11 = ListNode(0);
  ListNode? l1 = l11;
  l11.next = ListNode(2);
  l11 = l11.next;
  l11?.next = ListNode(4);
  l11 = l11?.next;
  l11?.next = ListNode(3);
  l11 = l11?.next;

  ListNode? l22 = ListNode(0);
  ListNode? l2 = l22;
  l22.next = ListNode(5);
  l22 = l22.next;
  l22?.next = ListNode(6);
  l22 = l22?.next;
  l22?.next = ListNode(4);

  // ListNode? printL1 = l1;
  // while (printL1 != null) {
  //   print('l1:${printL1.val}');
  //   printL1 = printL1.next;
  // }

  // ListNode? printL2 = l2;
  // while (printL2 != null) {
  //   print('l2:${printL2.val}');
  //   printL2 = printL2.next;
  // }

  ListNode? result = addTwoNumbers(l1.next, l2.next);
  while (result != null) {
    print('result:${result.val}');
    result = result.next;
  }
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  if (l1 == null) {
    return l2;
  }
  if (l2 == null) {
    return l1;
  }
  ListNode? result = ListNode(0);
  ListNode? finalResult = result;
  int numFirst = 0;
  while (l1 != null || l2 != null) {
    int? l1Num = l1 == null ? 0 : l1.val;
    int? l2Num = l2 == null ? 0 : l2.val;
    int num = l1Num + l2Num + numFirst;
    finalResult?.next = ListNode(num % 10);
    numFirst = num ~/ 10;
    finalResult = finalResult?.next;
    if (l1 != null) {
      l1 = l1.next;
    }
    if (l2 != null) {
      l2 = l2.next;
    }
    if (numFirst != 0) {
      finalResult?.next = ListNode(numFirst);
    }
  }
  return result.next;
}
