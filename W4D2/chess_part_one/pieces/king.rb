class King < Piece
  include Stepable
  
  def symbol
    "🤴🏻".colorize(:color => color, :background => :black)
  end

  def move_dirs
    [
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
      [0, -1],
      [-1, -1],
      [-1, 0],
      [-1, 1],
    ]
  end
end