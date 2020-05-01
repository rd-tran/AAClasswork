require 'rspec'
require 'card'

describe Card do
    
  describe '#initialize' do
    subject(:card) { Card.new(:heart, 2) }

    it "correctly initializes a card" do
      expect(card.suit).to eq(:heart)
      expect(card.value).to eq(2)
    end

    it "raises an error if given an invalid suit" do
      expect { Card.new(:leaf, 2) }.to raise_error("invalid suit")
    end

    it "raises an error if given an invalid number" do
      expect { Card.new(:heart, 15) }.to raise_error("invalid value")
    end
  end

  describe "#<=>(other_card)" do
    it "should return 0 if cards are the same" do
      expect(Card.new(:heart, 7) <=> Card.new(:heart, 7)).to eq(0) 
      expect(Card.new(:heart, 7) <=> Card.new(:spade, 7)).to_not eq(0) 
    end

    it "should return 1 if original card is greated than other card" do #club, diamond, heart, spade
      expect(Card.new(:heart, 7) <=> Card.new(:diamond, 7)).to eq(1)
      expect(Card.new(:diamond, 9) <=> Card.new(:heart, 4)).to eq(1)
      expect(Card.new(:diamond, 7) <=> Card.new(:heart, 7)).to_not eq(1)
    end

    it "should return -1 if original card is smaller than other card" do
      expect(Card.new(:club, 7) <=> Card.new(:diamond, 7)).to eq(-1)
      expect(Card.new(:diamond, 9) <=> Card.new(:heart, 9)).to eq(-1)
      expect(Card.new(:diamond, 7) <=> Card.new(:heart, 4)).to_not eq(-1)
    end
  end


end