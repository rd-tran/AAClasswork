# TODO Anagrams
# Our goal today is to write a method that determines if two given words are
# anagrams. This means that the letters in one word can be rearranged to form
# the other word.
# For example:

# ? anagram?("gizmo", "sally")    #=> false
# ? anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# * Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects
# each one's overall runtime

# TODO Phase I:
# Write a method #first_anagram? that will generate and store all the possible
# anagrams of the first string. Check if the second string is one of these.

def first_anagram?(str1, str2)
  result = anagrams(str1)
  result.include?(str2)
end

def anagrams(str)
  return [str] if str.length <= 1

  result = []
  str.each_char.with_index do |char, i|
    temp = str.dup
    temp[i] = ''
    result += anagrams(temp).map { |word| char + word }
  end

  result
end

# ? Hints:
# * For testing your method, start with small input strings,
  # * otherwise you might wait a while
# * If you're having trouble generating the possible anagrams,
  # * look into this method.
# * What is the time complexity of this solution?
  # * What happens if you increase the size of the strings?


# TODO Phase II:
# Write a method #second_anagram? that iterates over the first string.
# For each letter in the first string, find the index of that letter in the
# second string (hint: use Array#find_index) and delete at that index.
# The two strings are anagrams if an index is found for every letter and the
# second string is empty at the end of the iteration.

# Try varying the length of the input strings.
# What are the differences between #first_anagram? and #second_anagram??

def second_anagram?(str1, str2)
  str1.each_char.with_index do |char,i|
    idx = str2.index(char)
    if idx
        str2[idx] = ""
    else
        return false
    end
  end

  str2.empty?
end

# TODO Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings
# alphabetically. The strings are then anagrams if and only if the sorted
# versions are the identical.

# ? What is the time complexity of this solution?
  # Depends on the sorting algorithm
  # ? Is it better or worse than #second_anagram??

def third_anagram(str1,str2)
  str1.chars.sort == str2.chars.sort
end

# str1 = str1.each_char => n
# sort => nlog(n)
# (n + nlog(n)) * 2 => nlog(n)

# TODO Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the
# number of times each letter appears
# in both words. Compare the resulting hashes.

# ? What is the time complexity?
  # n

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }

  hash1 == hash2
end

# TODO Bonus: Do it with only one hash.

def bonus_anagram?(str1, str2)
  hash = Hash.new(0)
  
  str1.each_char { |char| hash[char] += 1 }
  str2.each_char { |char| hash[char] -= 1 }

  hash.values.sum == 0
  end
end

# ! Discuss the time complexity of your solutions together,
# ! then call over your TA to look at them.