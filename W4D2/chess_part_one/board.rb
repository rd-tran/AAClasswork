require "colorize"
require_relative "pieces/all_pieces"

class Board
  attr_reader :grid, :sentinel

  def initialize
    @sentinel = NullPiece.instance
    @grid = fill_board
  end

  def fill_board
    array = []

    (0..7).each do |i|
      back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
      pawn_row = Array.new(8) { Pawn }
      null_row = Array.new(8) { sentinel }

      case i
      when 0
        row = back_row.map.with_index { |piece, j| piece.new([i,j], self, :blue) }
        array << row
      when 1
        row = pawn_row.map.with_index { |piece, j| piece.new([i,j], self, :blue) }
        array << row
      when 2..5
        array << null_row
      when 6
        row = pawn_row.map.with_index { |piece, j| piece.new([i,j], self, :white) }
        array << row
      when 7
        row = back_row.map.with_index {|piece, j| piece.new([i,j], self, :white)}
        array << row
      end
    end

    array
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def valid_pos?(pos)
    row, col = pos
    (0...8).include?(row) && (0...8).include?(col)
  end


  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "No piece at start position" if self[start_pos].empty?
    raise ArgumentError.new "Cannot move to given position" unless self[end_pos].empty?
    
    piece = self[start_pos]
    moves = piece.moves

    if moves.include?(end_pos)
      self[start_pos] = sentinel
      piece.pos = end_pos
      self[end_pos] = piece
    else
      raise ArgumentError.new "This piece can't move there" 
    end
  end
end