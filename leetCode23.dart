// 23. 合并 K 个升序链表 https://leetcode.cn/problems/merge-k-sorted-lists/

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void main() {
  List<ListNode?> lists = [];
  ListNode l11 = ListNode();
  ListNode? head = l11;
  l11.next = ListNode(1);
  l11 = l11.next!;
  l11.next = ListNode(4);
  l11 = l11.next!;
  l11.next = ListNode(5);
  l11 = l11.next!;

  ListNode l22 = ListNode();
  ListNode? head2 = l22;
  l22.next = ListNode(1);
  l22 = l22.next!;
  l22.next = ListNode(3);
  l22 = l22.next!;
  l22.next = ListNode(4);
  l22 = l22.next!;

  ListNode l33 = ListNode();
  ListNode? head3 = l33;
  l33.next = ListNode(2);
  l33 = l33.next!;
  l33.next = ListNode(6);
  l33 = l33.next!;

  lists.add(head.next);
  lists.add(head2.next);
  lists.add(head3.next);
  ListNode? result = mergeKLists(lists);
  while (result != null) {
    print('result:${result.val}');
    result = result.next;
  }
}

ListNode? mergeKLists(List<ListNode?> lists) {
  ListNode? result = ListNode();
  if (lists.length == 1) {
    return lists[0];
  }
  for (int i = 0; i < lists.length; i++) {
    ListNode? temp = lists[i];
    ListNode? tempResult = result;
    result.next = mergeTwoLists(temp, tempResult.next);
  }
  return result.next;
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

    if (list1.val <= list2.val) {
      tempResult?.next = list1;
      list1 = list1.next;
      tempResult = tempResult?.next;
    } else {
      tempResult?.next = list2;
      list2 = list2.next;
      tempResult = tempResult?.next;
    }
  }
  return result.next;
}
