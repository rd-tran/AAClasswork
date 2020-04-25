require ".polytreenode/lib/00_tree_node.rb"

# TODO Phase 0: Description
# In this project we will create a class that will find the shortest path
# for a Chess Knight from a starting position to an end position.
# Both the start and end positions should be on a standard 8x8 chess board.

# NB: this problem is a lot like word chains!

# ? Write a class, KnightPathFinder.
class KnightPathFinder
  # ? Initialize your KnightPathFinder with a starting position. For instance:
    # kpf = KnightPathFinder.new([0, 0])
    # Ultimately, I want to be able to find paths to end positions:
      # kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
      # kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
  # To help us find paths, we will build a move tree.
  # The values in the tree will be positions. A node is a child of another node
  # if you can move from the parent position directly to the child position.
  # The root node of the tree should be the knight's starting position.
  # You will want to build on your PolyTreeNode work, using PolyTreeNode
  # instances to represent each position.

  # Start by creating an instance variable, self.root_node that stores the
  # knight's initial position in an instance of your PolyTreeNode class.
  
  # You will be writing an instance method
  # KnightPathFinder#build_move_tree to build the move tree, beginning with
  # self.root_node. Call this method in initialize; You will traverse the move
  # tree whenever #find_path is called. Don't write this yet though.
  def initialize

  end
end
