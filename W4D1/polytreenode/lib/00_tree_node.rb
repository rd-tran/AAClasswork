class PolyTreeNode
  attr_reader :value, :parent, :children

  # TODO Phase 1: Implement a PolyTreeNode class
  # Write a class with four methods:
  
  # An #initialize(value) method that sets the value, and starts parent as nil,
  # and children to an empty array.
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  # Write a #parent= method which
    # (1) sets the parent property and 
    # (2) adds the node to their parent's array of children
    # (unless we're setting parent to nil).
  def parent=(parent_node)
    unless self.parent == nil
      old_parent = self.parent
      old_parent.children.delete(self)
    end

    @parent = parent_node
    parent_node.children << self unless parent_node == nil
  end

  # Run bundle exec rspec to run the provided tests.
  # At this point, all the specs for #initialize and most of the specs for
  # #parent= should pass. (We'll get to the other specs soon!)

  # TODO Phase 2: Re-assigning Parents
  # Your #parent= code likely leaves a mess when re-assigning a parent.
  # Here's what I mean:
    # n1 = PolyTreeNode.new("root1")
    # n2 = PolyTreeNode.new("root2")
    # n3 = PolyTreeNode.new("root3")
    
    # # connect n3 to n1
    # n3.parent = n1
    # # connect n3 to n2
    # n3.parent = n2
    
    # # this should work
    # raise "Bad parent=!" unless n3.parent == n2
    # raise "Bad parent=!" unless n2.children == [n3]
    
    # # this probably doesn't
    # raise "Bad parent=!" unless n1.children == []

  # In addition to (1) re-assigning the parent attribute of the child and
  # (2) adding it to the new parent's array of children,
  # we should also remove the child from the old parent's list of children
  # (if the old parent isn't nil).
  # Modify your #parent= method to do this.
  
  # Make sure all the #parent= specs pass before proceeding!

  # TODO Phase 3: Adding Children
  # The easiest phase!
  
  # Write add_child(child_node) and remove_child(child_node) methods.
  # These methods should be one- or two-liners that call #parent=.
   def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if children.include?(child_node)
      child_node.parent = nil
    else
      raise ArgumentError.new("Argument is not a child of the parent node")
    end
  end

  # TODO Phase 4: Searching
  # Write a #dfs(target_value) method which takes a value to search for
  # and performs the search. Write this recursively.
    # First, check the value at this node.
    # If a node's value matches the target value, return the node.
    # If not, iterate through the #children and repeat.
  def dfs(target_value)
    return self if value == target_value

    children.each do |child_node|
      result = child_node.dfs(target_value)
      return result unless result.nil? 
    end

    nil
  end

  # Write a #bfs(target_value) method to implement breadth first search.
    # You will use a local Array variable as a queue to implement this.
    # First, insert the current node (self) into the queue.
    # Then, in a loop that runs until the array is empty:
      # Remove the first node from the queue,
      # Check its value,
      # Push the node's children to the end of the array.
  def bfs(target_value)
    queue = [self]
    
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue += node.children
    end

    nil
  end

  # Prove to yourself that this will check the nodes in the right order.
  # Draw it out. Show this explanation to your TA.
  # Get your TA to check your work!
  # Make sure all the specs pass.  
end