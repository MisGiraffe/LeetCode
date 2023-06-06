// 30. 串联所有单词的子串 https://leetcode.cn/problems/substring-with-concatenation-of-all-words/
void main() {
  String s = "barfoothefoobarman";
  List<String> words = ["foo", "bar"];
  print(findSubstring(s, words));
}

List<int> findSubstring(String s, List<String> words) {
  List<int> result = [];
  if (s.length == 0 || words.length == 0) {
    return result;
  }
  Map<String, int> wordsMap = {};
  // 字符串列表的长度
  int wordsLength = 0;
  for (int i = 0; i < words.length; i++) {
    // 字符串不包含字符串列表数据，直接return
    if (!s.contains(words[i])) {
      return result;
    }
    String word = words[i];
    wordsLength += word.length;
    // 存储单词出现的次数
    if (wordsMap[word] != null) {
      int temp = wordsMap[word] ?? 0;
      temp++;
      wordsMap[word] = temp;
    } else {
      wordsMap[word] = 1;
    }
  }
  // 字符串列表的长度 > 字符串长度，直接return
  if (wordsLength > s.length) {
    return result;
  }

  // 遍历所有子串
  for (int i = 0; i < s.length - wordsLength + 1; i++) {
    // 存储当前符合条件的单词
    Map<String, int> hasWordsMap = {};
    int num = 0;
    while (num < words.length) {
      String word = s.substring(
          i + num * words[0].length, i + (num + 1) * words[0].length);
      // 判断单词是否在wordsMap中
      if (wordsMap.containsKey(word)) {
        // 存储单词出现的次数
        if (hasWordsMap[word] != null) {
          int temp = hasWordsMap[word] ?? 0;
          temp++;
          hasWordsMap[word] = temp;
        } else {
          hasWordsMap[word] = 1;
        }
        int wordNum = wordsMap[word] ?? 0;
        int hasWordNum = hasWordsMap[word] ?? 0;
        if (hasWordNum > wordNum) {
          break;
        }
      } else {
        break;
      }
      num++;
    }
    //判断是不是所有的单词都符合条件
    if (num == words.length) {
      result.add(i);
    }
  }
  return result;
}
