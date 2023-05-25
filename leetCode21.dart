// 21. 合并两个有序链表 https://leetcode.cn/problems/merge-two-sorted-lists/

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void main() {
  ListNode l11 = ListNode();
  ListNode l1 = l11;
  l11.next = ListNode(1);
  l11 = l11.next!;
  l11.next = ListNode(2);
  l11 = l11.next!;
  l11.next = ListNode(4);
  l11 = l11.next!;

  ListNode l22 = ListNode();
  ListNode l2 = l22;
  // l22.next = ListNode(1);
  // l22 = l22.next!;
  // l22.next = ListNode(3);
  // l22 = l22.next!;
  // l22.next = ListNode(4);
  // l22 = l22.next!;

  ListNode? result = mergeTwoLists(l1.next, l2.next);
  while (result != null) {
    print(result.val);
    result = result.next;
  }
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  ListNode? result = ListNode();
  ListNode? tempResult = result;
  while (list1 != null || list2 != null) {
    if (list1 == null) {
      tempResult?.next = list2;
      list2 = list2?.next;
      tempResult = tempResult?.next;
      continue;
    }
    if (list2 == null) {
      tempResult?.next = list1;
      list1 = list1.next;
      tempResult = tempResult?.next;
      continue;
    }
    if (list1.val >= list2.val) {
      tempResult?.next = list2;
      list2 = list2.next;
    } else {
      tempResult?.next = list1;
      list1 = list1.next;
    }
    tempResult = tempResult?.next;
  }
  return result.next;
}
