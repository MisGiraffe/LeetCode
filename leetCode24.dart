// 24. 两两交换链表中的节点 https://leetcode.cn/problems/swap-nodes-in-pairs

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void main() {
  ListNode? list = ListNode();
  ListNode? head = list;
  list.next = ListNode(1);
  list = list.next;
  list?.next = ListNode(2);
  list = list?.next;
  list?.next = ListNode(3);
  list = list?.next;
  list?.next = ListNode(4);
  list = list?.next;

  ListNode? result = swapPairs(head.next);
  while (result != null) {
    print("result ${result.val}");
    result = result.next;
  }

  // ListNode? result2 = swapPairs2(head.next);
  // while (result2 != null) {
  //   print("result2 ${result2.val}");
  //   result2 = result2.next;
  // }
}

ListNode? swapPairs(ListNode? head) {
  ListNode? tempResult = ListNode();
  ListNode? result = tempResult;
  while (head != null && head.next != null) {
    ListNode? temp = head;
    ListNode? temp2 = head.next;
    head = head.next?.next;
    tempResult?.next = temp2;
    tempResult = tempResult?.next;
    tempResult?.next = temp;
    tempResult = tempResult?.next;
    tempResult?.next = null;
  }
  if (head != null) {
    tempResult?.next = head;
    tempResult = tempResult?.next;
  }
  return result.next;
}

// 递归法：
ListNode? swapPairs2(ListNode? head) {
  return doSwap(head);
}

ListNode? doSwap(ListNode? head) {
  // 不成对，直接返回
  if (head == null || head.next == null) return head;
  //开始交换
  ListNode? newhead = head.next;
  ListNode? nextPairHead = newhead?.next;
  newhead?.next = head;
  // 尾部指向下一对的 head
  head.next = doSwap(nextPairHead);

  return newhead;
}
