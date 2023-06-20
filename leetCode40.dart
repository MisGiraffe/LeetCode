// 40. 组合总和 II  https://leetcode.cn/problems/combination-sum-ii/

import 'dart:collection';

void main(List<String> args) {
  List<int> candidates = [10, 1, 2, 7, 6, 1, 5];
  int target = 8;
  print(combinationSum2(candidates, target));
}

List<List<int>> combinationSum2(List<int> candidates, int target) {
  if (candidates.length == 0) {
    return [];
  }
  candidates.sort();
  List<List<int>> result = [];
  Queue<int> path = Queue();
  dfs(candidates, candidates.length, 0, target, path, result);
  return result;
}

void dfs(List<int> candidates, int len, int begin, int target, Queue<int> path,
    List<List<int>> result) {
  if (target == 0) {
    result.add(path.toList());
    return;
  }
  for (int i = begin; i < len; i++) {
    // 大剪枝：减去 candidates[i] 小于 0，减去后面的 candidates[i + 1]、candidates[i + 2] 肯定也小于 0，因此用 break
    if (target - candidates[i] < 0) {
      break;
    }

    // 小剪枝：同一层相同数值的结点，从第 2 个开始，候选数更少，结果一定发生重复，因此跳过，用 continue
    if (i > begin && candidates[i] == candidates[i - 1]) {
      continue;
    }

    path.addLast(candidates[i]);
    // 调试语句 ①
    // print("递归之前 => ${path}，剩余 = ${target - candidates[i]}");

    // 因为元素不可以重复使用，这里递归传递下去的是 i + 1 而不是 i
    dfs(candidates, len, i + 1, target - candidates[i], path, result);

    path.removeLast();
    // 调试语句 ②
    // print("递归之后 => ${path}，剩余 = ${target - candidates[i]}");
  }
}
