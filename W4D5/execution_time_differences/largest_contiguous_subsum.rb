# TODOD Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays
# and return the max.

# Example:

    # list = [5, 3, -7]
    # largest_contiguous_subsum(list) # => 8

    # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7

# Example 2:

    # list = [2, 3, -6, 7, -6, 7]
    # largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# Example 3:

    # list = [-5, -1, -3]
    # largest_contiguous_subsum(list) # => -1 (from [-1])

    
# TODOD Phase I
# Write a function that iterates through the array and finds all sub-arrays
# using nested loops. First make an array to hold all sub-arrays.
# Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.
    
def largest_contiguous_subsum_1(array)
    subarrays = []
    array.each_with_index do |ele,i|
        (i...array.length).each do |j|
            subarrays << array[i..j]
        end
    end
    subarrays.map(&:sum).max
end
    
# TODO Phase II
# Let's make a better version. Write a new function using O(n) time with O(1)
# memory. Keep a running tally of the largest sum. To accomplish this efficient
# space complexity, consider using two variables. One variable should track the
# largest sum so far and another to track the current sum.
# We'll leave the rest to you.

# ! Get your story straight, and then explain your solution's time complexity
# ! to your TA.

def largest_contiguous_subsum_2(array)
    max_sum = nil
    current_sum = 0

    array.each do |ele|
        current_sum += ele
        max_sum = current_sum if max_sum.nil? || current_sum > max_sum
        current_sum = 0 if current_sum < 0
    end

    max_sum
end