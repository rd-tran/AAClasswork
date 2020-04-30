class Piece
  attr_reader :color
  attr_accessor :pos

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  # * Define to_s method
  # to print the Piece's symbol
  def to_s
    # Have a default for it
    # So the NullPiece can print out a space
    " #{symbol}"
  end
  
  # * Define symbol method
  # that represents the piece's symbol
  def symbol
    # Won't be implemented in parent class
    " ".colorize(:color => black, :background => :black)
  end

  # * Define empty? method
  # to check if this is a Piece, or a NullPiece
  def empty?
    false
  end

  # # * Define valid_moves method
  # # to filter out moves that will put you in check
  # def valid_moves

  # end

  # # * Define move_into_check?(end_pos)
  # # to check if a given move will put you in check
  # def move_into_check?(end_pos)

  # end

  def inspect
    "<Piece: #{self.class}; Position: #{pos}; Color: #{color}"
  end
  
  protected
  attr_reader :board
end