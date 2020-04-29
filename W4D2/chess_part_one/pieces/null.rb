require_relative "piece"

class NullPiece < Piece
  include Singleton
    
  def initialize
    @start_pos = nil
  end
end