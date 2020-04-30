module Stepable
  # * Define moves method 
  # to determine all possible moves that are valid
  # aka valid position on the board, and unblocked by team Piece
  # use the move_dirs method to determine possible directions
  # then use the grow_unblocked moves_in_dir(dx,dy) method to determine the move
  def moves
    poss_moves = []
    move_dirs.each do |dy, dx|
      new_pos = [dy + pos[0], dx + pos[1]]
      
      next unless board.valid_pos?(new_pos)
        
      if board[new_pos].empty?
        poss_moves << new_pos
      elsif board[new_pos].color != self.color
        poss_moves << new_pos
      end
    end

    poss_moves
  end

  # * Define move_dirs
  # to determine direction(s) that the piece can move
  # ! Define this in the subclass because each of the steppable pieces
  # ! can move differently
end