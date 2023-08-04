from collections import Counter

def UncommonWords(A, B):
     
    # split the strings A and B into words and create sets
    setA = set(A.split())
    setB = set(B.split())
     
    # find the uncommon words in setA and setB and combine them
    uncommonWords = setA.difference(setB).union(setB.difference(setA))
     
    # convert the set to a list and return
    return list(uncommonWords)

def find_uncommon_words(str1, str2):
  """
  Finds the uncommon words from two Strings.

  Args:
    str1: The first string
    str2: The second string

  Returns:
    list: A list of uncommon words
  """

  uncommon_words = []
  words_set1 = set(str1.split())
  words_set2 = set(str2.split())

  for word in words_set1:
    if word not in words_set2:
      uncommon_words.append(word)

  for word in words_set2:
    if word not in words_set1:
      uncommon_words.append(word)

  return uncommon_words

if __name__ == "__main__":
  str1 = "This is a string."
  str2 = "This is another string."
  uncommon_words = find_uncommon_words(str1, str2)
  print(uncommon_words)

