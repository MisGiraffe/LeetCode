// 39. 组合总和 https://leetcode.cn/problems/combination-sum

import 'dart:collection';

void main(List<String> args) {
  List<int> candidates = [2, 3, 6, 7];
  int target = 7;

  print(combinationSum(candidates, target));
}

List<List<int>> combinationSum(List<int> candidates, int target) {
  int len = candidates.length;
  List<List<int>> result = [];
  if (len == 0) {
    return result;
  }

  Queue<int> path = Queue();
  dfs(candidates, 0, len, target, path, result);
  return result;
}

void dfs(List<int> candidates, int begin, int len, int target, Queue<int> path,
    List<List<int>> result) {
  if (target < 0) {
    return;
  }
  if (target == 0) {
    result.add(path.toList());
  }

  for (int i = begin; i < len; i++) {
    path.addLast(candidates[i]);
    dfs(candidates, i, len, target - candidates[i], path, result);
    path.removeLast();
  }
}
