// 25. K 个一组翻转链表 https://leetcode.cn/problems/reverse-nodes-in-k-group/

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
  int k = 2;

  ListNode? result = reverseKGroup(head.next, k);
  while (result != null) {
    print('result:${result.val}');
    result = result.next;
  }
}

ListNode? reverseKGroup(ListNode? head, int k) {
  ListNode? tail = head;
  for (int i = 0; i < k; i++) {
    if (tail == null) {
      return head;
    }
    tail = tail.next;
  }
  ListNode? per;
  ListNode? current = head;
  while (current != tail) {
    ListNode? temp = current?.next;
    current?.next = per;
    per = current;
    current = temp;
  }
  head?.next = reverseKGroup(tail, k);
  return per;
}
