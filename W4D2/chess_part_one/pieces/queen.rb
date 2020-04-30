class Queen < Piece
  include Slideable

  def symbol
    "👸🏻".colorize(:color => color, :background => :black)
  end

  def move_dirs
    horizontal_dirs.concat(diagonal_dirs)
  end
end