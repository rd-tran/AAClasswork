require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton

  attr_accessor :pos

  def initialize
    @color = :none
  end

  # * Define empty? method
  # to check if this is a Piece, or a NullPiece
  def empty?
    true
  end

  # # * Define valid_moves method
  # # to filter out moves that will put you in check
  # def valid_moves

  # end

  # # * Define move_into_check?(end_pos)
  # # to check if a given move will put you in check
  # def move_into_check?(end_pos)

  # end
end