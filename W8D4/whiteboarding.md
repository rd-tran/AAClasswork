*****REMINDER**** Please Whiteboard these in your new favorite language!  JavaScript!
Problem #1
Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
Example 1:
Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:
Input: "cbbd"
Output: "bb"

Iterate over each character in the input string through nested loops to find
substrings
Use two variables
One to store the value of the longest palindromic substring
The second to store the value of the current substring
If the current substring is a palindrome, and longer than the longest palindromic
substring, then I will replace it

Will build one helper function to determine whether a substring is a palindrome

function isPalindrome(str) {
  let reversedStr = ''

  for (let i = str.length - 1; i >= 0; i--) {
    char = str[i];
    reversedStr += char;
  }

  return reversedStr === str;
}

function longestPalSubs {
  let longestPal = '';
  let substring = '';

  for (let i = 0; i < str.length; i++) {
    for (let j = i; j < str.length; j++) {
      substring = str.substrings(i, j + 1);
      if (isPalindrome(substring) && substring.length > longestPal.length) {
        longestPal = substring;
      }
    }
  }

  return longestPal;
}


Problem #2
Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous row.
Example 1:
Input:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 3
Output: true
Example 2:
Input:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 13
Output: false
bsearch in the outer array and check if the given target is greter than the first and smaller than the last element of the array 

if true i do custom bsearch  

function Finder(matrix, target) {
let mid = matrix.length / 2; 

if (matrix[mid][0] < target && target < matrix[mid][matrix.length-1]){
  
}
  

}



function bSearch(array, target){ 

}