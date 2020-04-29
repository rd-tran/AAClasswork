class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(pos, board, color)
    @pos = pos
    @board
    @color
  end

  # * Define to_s method
  # to print the Piece's symbol
  def to_s

  end
  
  # * Define symbol method
  # that represents the piece's symbol
  def symbol
    # Won't be implemented in parent class
  end

  # * Define empty? method
  # to check if this is a Piece, or a NullPiece
  def empty?

  end

  # * Define valid_moves method
  # to filter out moves that will put you in check
  def valid_moves

  end

  # * Define move_into_check?(end_pos)
  # to check if a given move will put you in check
  def move_into_check?(end_pos)

  end
end