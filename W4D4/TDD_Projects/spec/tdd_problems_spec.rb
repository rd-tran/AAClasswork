require 'tdd_problems'
require 'rspec'

describe "my_uniq" do
  let(:array) { [0, 1, 2, 1, 2, 3] }
  let(:uniq_arr) { my_uniq(array) }

  it "removes duplicates" do
    expect(uniq_arr).to eq([0, 1, 2, 3])
  end

  it "does not modify original array" do
    expect { my_uniq(array) }.to_not change{ array }
  end

  it "contains only elements from original array" do
    uniq_arr.each do |ele|
      expect(array).to include(ele)
    end
  end
end

describe "Array" do
  let(:array) { [-1, 0, 2, -2, 1] }
  let(:result) {array.two_sum}

  describe "#two_sum" do
    it "returns an array of positions with elements that sum to zero" do
      idx1, idx2 = result[0]
      expect(array[idx1] + array[idx2]).to eq(0)

      idx3, idx4 = result[1]
      expect(array[idx3] + array[idx4]).to eq(0)
    end

    it "resulting pairs should be sorted" do 
      expect(result).to eq(result.sort)
    end

    it "properly gets all pairs" do 
      expect(result).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "my_transpose" do
  it "properly transposes a matrix" do 
    matrix = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
    expect(my_transpose(matrix)).to eq([
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ])
  end
end

describe "pick_stock" do
  context "can return a profit" do
    it "returns the days with the largest profit" do
      array = [3, 1, 0, 4, 6, 9]
      expect(pick_stock(array)).to eq([2,5])
    end
  end
  context "cannot return a profit" do
    it "returns nil" do 
      array = [5, 4, 3, 2, 1]
      expect(pick_stock(array)).to eq(nil)
    end
  end
end

describe 'TowersOfHanoi' do
  subject(:game) { TowersOfHanoi.new }

  describe "#move(start_pos, end_pos)" do 
    context "if move is invalid" do
      it "raises an error if moving larger disk onto smaller disk" do 
        allow(game).to receive(:towers).and_return([
          [3],
          [2, 1],
          []
        ])
        expect{game.move(0,1)}.to raise_error("invalid move")
      end

      it "raises an error if start position is empty" do
        expect{game.move(1,2)}.to raise_error(ArgumentError)
      end
    end

    context "if move is valid" do
      it "moves smaller disk onto larger disk" do
        allow(game).to receive(:towers).and_return([
          [3, 2],
          [1],
          []
        ])

        game.move(1,0)

        expect(game.towers).to eq([
          [3, 2, 1],
          [],
          []
        ])
      end
    end
    
    # @towers = [
    #   [3, 2, 1],
    #   [],
    #   []
    # ]

  end

  describe "#won?" do 
    it "should return true if the game has been won" do
      allow(game).to receive(:towers).and_return([
        [],
        [],
        [3, 2, 1]
      ])
      expect(game.won?).to eq(true)
    end
  end

end