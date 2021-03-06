# TODO Phase 1: IntSet
# A Set is a data type that can store unordered, unique items.
# Sets don't make any promises regarding insertion order, and they won't store
# duplicates. In exchange for those constraints, sets have remarkably fast
# retrieval time and can quickly look up the presence of values.

# Many mathematicians claim that sets are the foundation of mathematics, so
# basically we're going to build all of mathematics today. No big deal.

# A set is an abstract data type (ADT). An ADT can be thought of as a high-level
# description of a structure and an API (i.e., a specific set of methods).
# Examples of ADTs are things like sets, maps, or queues.
# But any given data type or API can be realized through many different
# implementations. Those implementations are known as data structures.

# Different data structures can implement the same abstract data type, but some
# data structures are worse than others. We're going to show you the best
# implementations, or close to them.
# (In reality, there's usually no single best implementation of an ADT;
# there are always tradeoffs.)

# Sound cool yet? Now let's go build a Set.

# TODO MaxIntSet
# We'll start with the first stage. In this version of a set, we can only store
# integers that live in a predefined range. So I tell you the maximum integer
# I'll ever want to store, and you give me a set that can store it and any
# smaller non-negative number.


# * Initialize your MaxIntSet with an integer called max to define the range of
# * integers that we're keeping track of.

# * Internal structure:
  # An array called @store, of length max
  # Each index in the @store will correspond to an item, and the value at that 
    # index will correspond to its presence (either true or false)
  # e.g., the set { 0, 2, 3 } will be stored as: [true, false, true, true]
  # The size of the array will remain constant!
  # The MaxIntSet should raise an error if someone tries to insert, remove, or
    # check inclusion of a number that is out of bounds.

# * Methods:
  #insert
  #remove
  #include?

require 'byebug'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if is_valid?(num)
      store[num] = true
    else
      raise "Out of bounds"
    end
 
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
    (0...store.length).include?(num)
  end

  def validate!(num)
  end
end

# ! Once you've built this and it works, we'll move on to the next iteration.

# TODO IntSet
# Now let's see if we can keep track of an arbitrary range of integers.
# Here's where it gets interesting. Create a brand new class for this one.
# We'll still initialize an array of a fixed length--say, 20.
# But now, instead of each element being true or false, they'll each be sub-arrays.

# Imagine the set as consisting of 20 buckets (the sub-arrays).
# When we insert an integer into this set, we'll pick one of the 20 buckets
# where that integer will live.
# That can be done easily with the modulo operator: i = n % 20.

# Using this mapping, which wraps around once every 20 integers, every integer
  # will be deterministically assigned to a bucket.
  # Using this concept, create your new and improved set.

# Initialize an array of size 20, with each containing item being an empty array.
# To look up a number in the set, modulo (%) the number by the set's length,
  # and add it to the array at that index. If the integer is present in that
  # bucket, that's how we know it's included in the set.
# You should fill out the #[] method to easily look up a bucket in the store -
  # calling self[num] will be more DRY than @store[num % num_buckets]
  # at every step of the way!
# Your new set should be able to keep track of an arbitrary range of integers,
  # including negative integers. Test it out.

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  
  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

# TODO ResizingIntSet
# The IntSet is okay for small sample sizes. But if the number of elements grows
# pretty big, our set's retrieval time depends more and more on an array scan,
# which is what we're trying to get away from. It's slow.

# Scanning for an item in an array (when you don't know the index) takes O(n)
# time, because you potentially have to look at every item. So if we're having
# to do an array scan on one of the 20 buckets, that bucket will have on average
# 1/20th of the overall items. That gives us an overall time complexity
# proportional to 0.05n. When you strip out the 0.05 constant factor, that's
# still O(n). Meh.

# Let's see if we can do better.

# Make a new class. This time, let's increase the number of buckets as the size
  # of the set increases. The goal is to have store.length > N at all times.
# You may want to implement an inspect method to make debugging easier.
# What are the time complexities of the operations of your set implementation?

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num 
      @count += 1
    end

    resize! if @count >= num_buckets
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    elements = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    elements.each { |num| insert(num) }
  end
end