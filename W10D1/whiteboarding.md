Problem #1
You are climbing a stair case. It takes n steps to reach to the top.
Each time you can either climb 1 or 2 steps.
In how many distinct ways can you climb to the top?
Note: Given n will be a positive integer.

Example 1:
Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps

Example 2:
Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step

I'm given n steps
I want to figure out how to reach those steps using a combination of 
1 or 2 steps per turn
And I want to figure out how many combinations I can create to reach the top of
the steps
Create an array of possible steps: 
  [1, 2]
n = 3
Determine out of my two possible moves, which of them are valid
n = 2

function stepCombination(n) {
  let combinations = 0;
  let moves = [1, 2];

  if (n === 0) combinations++;

  for (let i = 0; i < moves.length; i++) {
    let move = moves[i];

    if (n >= move) {
      stepCombination(n - move);
    }
  }

  return combinations;
}


Problem #2
Given an array nums, write a function to move all 0's to the end of it while
maintaining the relative order of the non-zero elements.

Example:
Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:
Minimize the total number of operations.

