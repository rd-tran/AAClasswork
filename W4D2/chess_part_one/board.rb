require_relative "piece"
require_relative "null_piece"

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    # back row = [rook, knight, bishop, queen, king]
    @sentinel = NullPiece.new
  end

  def move_piece(start_pos, end_pos)

  end
end