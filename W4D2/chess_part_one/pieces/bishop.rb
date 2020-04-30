class Bishop < Piece
  include Slideable

  def symbol
    "♝".colorize(:color => color, :background => :black)
  end

  def move_dirs
    diagonal_dirs
  end
end