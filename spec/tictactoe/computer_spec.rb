require 'spec_helper'

describe Computer do
	let (:output) {output = double('output').as_null_object}
  describe "choose_move" do
    it "should be able to make a move" do
    	board = Board.new([1,2,3,4,5,6,7,8,9], output)
      c = Computer.new
      c.choose_move(board).should be > 0
      c.choose_move(board).should be < 10
    end
  end

  context "choosing a move" do
  	it "should always choose a winning move if it is available" do
  		board = Board.new(["X","X",3,4,5,6,7,8,9], output)
  		c = Computer.new
  		c.choose_move(board).should == 3
  	end
  end
end
