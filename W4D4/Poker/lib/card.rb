class Card
  SUITS = [:club, :diamond, :heart, :spade]
  attr_reader :suit, :value 
  

  def initialize(suit, value)
    raise "invalid suit" unless SUITS.include?(suit)
    raise "invalid value" unless (1..13).include?(value)
    @suit = suit
    @value = value
  end

  def <=>(other_card)
    case other_card 
    when other_card.value < self.value
      return - 1
    when other_card.value > self.value
      return 1
      
  end

end