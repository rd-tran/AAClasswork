class Rook < Piece
  include Slideable

  def symbol
    "♖".colorize(:color=>:black, :background=>color)
  end
  
  def move_dirs
    horizontal_dirs
  end
end