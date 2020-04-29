require_relative "pieces/piece"
require_relative "pieces/null"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid.each_with_index do |row, i|
        row.each_with_index do |col, j|
            if i == 0 || i == 1 || i == 6 || i == 7
                @grid[i][j] = Piece.new([i,j])
            else
                @grid[i][j] = nil
            end
        end
    end
    # back row = [rook, knight, bishop, queen, king]
    @sentinel = NullPiece.instance
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def valid_pos?(pos)
    row, col = pos
    (0...8).include?(row) && (0...8).include?(col)
  end


  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "No piece at given position(s)" if self[start_pos] == nil
    raise ArgumentError.new "Cannot move to given position" unless self[end_pos] == nil
    piece = self[start_pos]
    self[start_pos] = nil
    
    piece.pos = end_pos
    self[end_pos] = piece
  end
end