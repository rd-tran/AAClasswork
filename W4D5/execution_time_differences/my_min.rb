# TODO my_min
# * Given a list of integers find the smallest number in the list.

# Example:

    # ? list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # ? my_min(list)  # =>  -5

# * Phase I
# First, write a function that compares each element to every other element of
# the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min_phase_1(array)
  min_ele = 0

  array.each do |ele|
    my_array = array.dup
    my_array.delete(ele)
    min_ele = ele if my_array.all? { |el| ele < el }
  end
  
  min_ele
end

# * Phase II
# Now rewrite the function to iterate through the list just once while keeping
# track of the minimum. What is the time complexity?

def my_min_phase_2(array)
  min_ele = array[0]

  array.each do |ele|
    min_ele = ele if ele < min_ele
  end

  min_ele
end