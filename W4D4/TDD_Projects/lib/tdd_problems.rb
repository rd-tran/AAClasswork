# '************* Remove Dups ******************'
# Remove dups
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:

# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and return a new array.

def my_uniq(array)
  result = []

  array.each do |ele|
    result << ele unless result.include?(ele)
  end
  result
end


# '************* Two Sum ******************'
# Two sum
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.

# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. 
# We want the array of pairs to be sorted "dictionary-wise":

# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)
class Array 

  def two_sum
    result = []

    (0...self.length - 1).each do |start_idx|
      (start_idx + 1...self.length).each do |last_idx|
        sum = self[start_idx] + self[last_idx]
        result << [start_idx, last_idx] if sum == 0
      end
    end

    result
  end


end


# '************* My Transpose ******************'
# My Transpose
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:

# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]

# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# We could equivalently have stored the matrix as an array of columns:

# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:

# my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]

def my_transpose(matrix)
  row = matrix.first.length
  result = Array.new(row) { Array.new(row) }

  row.times do |i|
    row.times do |j|
      result[j][i] = matrix[i][j]
    end
  end

  result
end


# '************* Stock Picker ******************'
# Stock Picker
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs 
# the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!

def pick_stock(stocks)
  min = stocks.min
  max = stocks.max
  min_idx = stocks.index(min)
  max_idx = stocks.index(max)

  min_idx < max_idx ? [min_idx, max_idx] : nil

end

# '************* Towers of Hanoi ******************'
require 'byebug'
class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [ [3, 2, 1],[],[] ]
  end

  def is_valid?(start_pos, end_pos)
    raise ArgumentError if towers[start_pos].empty?
    if !towers[end_pos].empty? && towers[start_pos].last > towers[end_pos].last
      raise "invalid move" 
    end
    true
  end

  def move(start_pos, end_pos)
    if is_valid?(start_pos, end_pos)
      towers[end_pos] << towers[start_pos].pop
    end
  end

  def won?
    towers[0].empty? && (towers[1] == [3, 2, 1] || towers[2] == [3, 2, 1])
  end

  def play
    until won?
      begin
        puts "Enter a start position"
        start_pos = gets.chomp.to_i
        puts "Enter an end position"
        end_pos = gets.chomp.to_i

        if is_valid(start_pos, end_pos)
          move(start_pos, end_pos)
        end 
      rescue RuntimeError => e
        puts "Invalid move, try again"
        retry
      rescue ArgumentError => e
        puts "No disk at starting position, try again"
        retry
      end
    end

    puts "You win!"
  end

end
