module Slideable
  # * Initialize class constant HORIZONTAL_DIRS
  # to contain the straight movements (up, down, left, right)
  HORIZONTAL_DIRS = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]

  # * Initialize class constant DIAGONAL_DIRS
  # to contain the diagonal movements
  # (top-left, top-right, bottom-left, bottom-right)
  DIAGONAL_DIRS = [
    [-1,-1],
    [-1,1],
    [1,-1],
    [1,1]
  ]

  # * Define horizontal_dirs
  # to return the HORIZONTAL_DIRS array
  def horizontal_dirs
    HORIZONTAL_DIRS  
  end

  # * Define diagonal_dirs
  # to return the DIAGONAL_DIRS array
  def diagonal_dirs
    DIAGONAL_DIRS
  end

  # * Define moves method
  # to determine all possible moves that are valid
  # aka valid position on the board, and unblocked by team Piece
  # use the move_dirs method to determine possible directions
  # then use the grow_unblocked moves_in_dir(dx,dy) method to determine the move
  def moves
    # Initialize an empty array to store all the possible moves
    # Iterate through each of the piece's directions
    # Call grow_unblocked_moves_in_dir using that direction
    # ex:
      # dy, dx = [-1, 0]
      # pass dx and dy into grow_unblocked_moves
    
    poss_moves = []
    move_dirs.each { |dy, dx| poss_moves += grow_unblocked_moves_in_dir(dx, dy) }
    poss_moves
  end
  
  # * Define move_dirs
  # to determine direction(s) that the piece can move
  # ! Define this in the subclass because each of the slideable pieces
  # ! can move differently
  
  # * Define grow_unblocked_moves_in_dir(dx, dy)
  # to determine possible moves
  # get a possible position in a direction the Piece can move towards
  # use the board#valid_pos?(pos) method to check the pos is valid
  # then check that the path to the position is not blocked by a team Piece
  def grow_unblocked_moves_in_dir(dx, dy)
    # dx => horizonal direction
    # dy => vertical direction
    # If we are the rook, then we can pass in one of his move_dirs
    # Initialize an empty array, to store all the positions it can move into
    # Move one spot into the given direction
    # Check if that given direction is possible
      # Aka, the position is not taken by a teammate
        # This is the last position that it cannot move into for this direction
    # Can move into the position of an enemy piece
      # But this is the last position it can move onto for this direction
    # Return the array of all the positions that are valid
      # Check above for what valid means (lines 61 - 66)

    moves = []
    row, col = pos

    while true
      row, col = row + dy, col + dx
      new_pos = [row, col]
      # debugger

      return moves unless board.valid_pos?(new_pos)

      # debugger
      if board[new_pos].empty?
        # debugger
        moves << new_pos
      elsif board[new_pos].color == self.color
        # debugger
        return moves
      elsif board[new_pos].color != self.color
        # debugger
        moves << new_pos
        return moves
      end
    end
  end
end