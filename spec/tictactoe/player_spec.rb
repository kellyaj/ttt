require 'spec_helper'

describe Player do
  let (:output) {output = double('output').as_null_object}
  let (:p) { Player.new(Human.new) }
  let (:board) { Board.new([1,2,3,4,5,6,7,8,9], output) }

  it "initialize with a player type" do
  	p.player_type.class.should == Human
  end

  describe "#choosing moves" do
  	it "should be able to get a move from a human player type" do
      fake_human = double('human')
      fake_human.stub(:choose_move).and_return(1)
      p = Player.new(fake_human)
  		p.get_player_move(board).should == 1
  	end

  	it "should be able to get a move from a computer player type" do
  		computer = Player.new(Computer.new("X"))
  		computer.get_player_move(board).should be_an(Integer)
  	end
  end
end
