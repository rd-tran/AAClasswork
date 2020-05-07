Problem 1:
Given a pattern and a string str, determine if str follows the same pattern.


Example 1
Input: pattern = "abba", str = "dog cat cat dog"
Output: true
Example 2
Input: pattern = "abba", str = "dog cat cat fish"
Output: false
Example 3
Input: pattern = "aaaa", str = "dog cat cat dog"
Output: false
Example 4
Input: pattern = "abba", str = "dog dog dog dog"
Output: false
You may assume pattern contains only lowercase letters, and str contains
lowercase letters that may be separated by a single space.
Can you solve it in O(N) time and O(1) space?

pattern = 'aabb', str = 'dog dog cat cat dog'
output: false

#{ a=> dog, b => cat} 
def pattern_match(pattern, str)
    hash = {}
    split = str.split(" ")
    pattern.each_char.with_index do |char, idx|
        if !hash.keys.include?(char)
            hash[char] = str[idx]
        else 
           if hash[char] != str[idx]
            return false
        end
    end
    true
end 

Problem 2:
Given two strings S and T, return if they are equal when both are typed into
empty text editors.
In this case, # indicates a backspace character.

initialize two variables
each of these variables are going to store the outcome of the original string
Ex (s); iterate through each character, and add that character along the way,
but if I hit a # then I'll simply delete that last character

def pattern_match2)(str1, str2)
  outcome_1 = helper_func(str1)
  outcome_2 = helper_func(str2)

  outcome_1 == outcome_2
end

def helper_func(str)
  outcome = ''

  str.each_char do |char|
    if char == '#'
      outcome[-1] = ''
    else
      outcome += char
    end
  end

  outcome
end

Example 1
Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".
Example 2
Input: S = "ab##", T = "c#d#"
Output: true
Explanation: Both S and T become "".
Example 3
Input: S = "a##c", T = "#a#c"
Output: true
Explanation: Both S and T become "c".
Example 4
Input: S = "a#c", T = "b"
Output: false
Explanation: S becomes "c" while T becomes "b".

Note:
1. 1 <= S.length <= 200
2. 1 <= T.length <= 200
3. S and T only contain lowercase letters and '#' characters.
Can you solve it in O(N) time and O(1) space?