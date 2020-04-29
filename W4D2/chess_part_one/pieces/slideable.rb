module Slideable
  # * Initialize class constant HORIZONTAL_DIRS
  # to contain the straight movements (up, down, left, right)
  HORIZONTAL_DIRS = [
      []
  ]

  # * Initialize class constant DIAGONAL_DIRS
  # to contain the diagonal movements
  # (top-left, top-right, bottom-left, bottom-right)
  DIAGONAL_DIRS = [
      []
  ]

  # * Define horizontal_dirs
  # to return the HORIZONTAL_DIRS array
  def horizontal_dirs

  end

  # * Define diagonal_dirs
  # to return the DIAGONAL_DIRS array
  def diagonal_dirs

  end

  # * Define moves method
  # to determine all possible moves that are valid
  # aka valid position on the board, and unblocked by team Piece
  # use the move_dirs method to determine possible directions
  # then use the grow_unblocked moves_in_dir(dx,dy) method to determine the move
  def moves
    
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

  end
end