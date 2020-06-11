Problem 1: 
Input: "()[]{}"

let left includes? 
    if else bracket/parent/curly

let last_type = [
    {,
]

    let bracket = []
    let bracket = {}
    let bracket = ()

let right includes? (],),} 
    if else bracket/parent/curly

    return bracket/parent/curly != false

    contained

possibilities = [
  '[]',
  '{}',
  '()'
]



Problem #2
You are a product manager and currently leading a team to develop a new product.
Unfortunately, the latest version of your product fails the quality check.
Since each version is developed based on the previous version,
all the versions after a bad version are also bad.
Suppose you have n versions [1, 2, ..., n] and you want to find out the first
bad one, which causes all the following ones to be bad.
You are given an API bool isBadVersion(version) which will return whether
version is bad.
Implement a function to find the first bad version.
You should minimize the number of calls to the API.

Example:
Given n = 5, and version = 4 is the first bad version.
call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true
Then 4 is the first bad version.

function rootError(n) {
  for (let i = n; i >= 0; i--) {
    if ( !isBadVersion(i) ) return i + 1;
  } 
}