require_relative "00_tree_node"
require 'byebug'

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

  attr_reader :root_node

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos) 
    @considered_positions = [pos]
    build_move_tree
  end

  # TODO Phase I: #new_move_positions
  # Before we start #build_move_tree, you'll want to be able to find new
  # positions you can move to from a given position.
  # Write a class method KnightPathFinder::valid_moves(pos).
  # There are up to eight possible moves.

  # You'll also want to avoid repeating positions in the move tree.
  # For instance, we don't want to infinitely explore moving betweeen the same
  # two positions. Add an instance variable, @considered_positions to keep track
  # of the positions you have considered; initialize it to the array containing
  # just the starting pos. Write an instance method #new_move_positions(pos);
  # this should call the ::valid_moves class method, but filter out any
  # positions that are already in @considered_positions. It should then add the
  # remaining new positions to @considered_positions and return these new
  # positions.
  
  # * STARTING POSITION
  # [0, 0]
  # * POSSIBLE POSITIONS
  # [-2, -1]
  # [-2, 1]
  # [2, -1]
  # [2, 1]
  # [-1, -2]
  # [-1. 2]
  # [1, -2]
  # [1, 2]
  # * Check if possible positions are valid_moves
  # if they are, then we want to shovel them into our considered_positions

  def self.valid_moves(pos)
    row, col = pos
    possible_additions = [
      [-2, -1],
      [-2, 1],
      [2, -1],
      [2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2]
    ]

    within_board = Proc.new do |row, col|
      (0..7).include?(row) && (0..7).include?(col)
    end

    possible_moves = []
    possible_additions.each do |move|
      move_r, move_c = move
      new_pos = [row + move_r, col + move_c]
      new_r, new_c = new_pos

      possible_moves << new_pos if within_board.call(new_r, new_c)
    end

    possible_moves.uniq
  end


  def new_move_positions(pos)
    positions = KnightPathFinder.valid_moves(pos)
    
    # Return an array of currently considered positions
    not_considered = Proc.new do |position|
      !@considered_positions.include?(position)
    end

    result = positions.select(&not_considered)
    @considered_positions += result

    result
  end

  # TODO Phase II: #build_move_tree
  # Let's return to #build_move_tree.
  # We'll use our #new_move_positions instance method.

  # To ensure that your tree represents only the shortest path to a given
  # position, build your tree in a breadth-first manner. Take inspiration from
  # your BFS algorithm: use a queue to process nodes in FIFO order. Start with
  # a root node representing the start_pos and explore moves from one position
  # at a time.

  # Next build nodes representing positions one move away, add these to the
  # queue. Then take the next node from the queue... until the queue is empty.

  # When you have completed, and tested, #build_move_tree get a code review
  # from your TA.

  def build_move_tree
    queue = [root_node]

    until queue.empty?
      node = queue.shift

      positions = new_move_positions(node.value)

      positions.each do |position|
        child_node = PolyTreeNode.new(position)

        node.add_child(child_node)
        queue << child_node
      end
    end
  end

end
