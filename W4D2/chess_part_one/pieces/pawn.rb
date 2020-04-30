require_relative 'piece'

class Pawn < Piece
  def symbol
    pawn = "♟".colorize(:color => color, :background => :black)
  end

  def moves
    # check the color
    # assign move_dir var to be the corresponding move
        # aka move_white, or move_blue
    # Assign the attack var to be the corresponding attack
        # aka attack_white, or attack_blue
    # Check if it can move in that direction,
        # or if it can kill in one of the corresponding directions
    # Also ensure all the three moves are within the board

    poss_moves = []
    row, col = pos

    if at_start_row?
      new_pos = [row + (forward_dir * 2), col]
    else
      new_pos = [row + forward_dir, col]
    end

    if board.valid_pos?(new_pos) && board[new_pos].empty?
      poss_moves << new_pos 
    end

    poss_moves.concat(attacks)
  end

  def at_start_row?
    row, col = pos
    return row == 1 if color == :blue
    return row == 6 if color == :white 
  end

  def forward_dir
    if color == :blue
      return 1
    elsif color == :white 
      return -1
    end
  end

  def attacks
    attacks = []
    row, col = pos
    
    attack_dir = color == :blue ? attack_blue : attack_white
    
    attack_dir.each do |dy, dx|
      new_pos = [row + dy, col + dx]
      
      if board.valid_pos?(new_pos) && !board[new_pos].empty?
        attack << new_pos unless board[new_pos].color == self.color
      end
    end

    attacks
  end

  def attack_white
    [
      [-1, -1],
      [-1, 1]
    ]
  end

  def attack_blue
    [
      [1, -1],
      [1, 1]
    ]
  end
end