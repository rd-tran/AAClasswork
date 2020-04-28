require_relative "piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    
    def initialize
        @start_pos = nil
    end
end