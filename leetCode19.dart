// 19. 删除链表的倒数第 N 个结点 https://leetcode.cn/problems/remove-nth-node-from-end-of-list

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void main() {
  ListNode l11 = ListNode();
  ListNode? head = l11;
  l11.next = ListNode(1);
  l11 = l11.next!;
  l11.next = ListNode(2);
  l11 = l11.next!;
  l11.next = ListNode(3);
  l11 = l11.next!;
  l11.next = ListNode(4);
  l11 = l11.next!;
  l11.next = ListNode(5);
  l11 = l11.next!;

  ListNode? printL1 = head.next;
  while (printL1 != null) {
    print('l1:${printL1.val}');
    printL1 = printL1.next;
  }

  int n = 2;

  ListNode? result = removeNthFromEnd(head.next, n);
  while (result != null) {
    print('result:${result.val}');
    result = result.next;
  }
}

ListNode? removeNthFromEnd(ListNode? head, int n) {
  ListNode? result = ListNode();
  result.next = head;
  ListNode? fastNode = result;
  ListNode? slowNode = result;
  for (int i = 0; i < n; i++) {
    fastNode = fastNode?.next;
  }
  while (fastNode?.next != null) {
    fastNode = fastNode?.next;
    slowNode = slowNode?.next;
  }
  slowNode!.next = slowNode.next?.next;
  return result.next;
}
