class Knight < Piece
  include Stepable
  
  def symbol
    "♘".colorize(:color => color, :background => :black)
  end

  def move_dirs
    [
      [1, 2],
      [2, 1],
      [-2, -1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [-2, 1],
      [2, -1],
    ]
  end
end