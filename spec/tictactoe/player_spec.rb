require 'spec_helper'

describe Player do
  it "should initialize with a mark" do
    p = Player.new("X", Human.new)
    p.mark.should == "X"
  end

  it "initialize with a player type" do
  	p = Player.new("X", Human.new)
  	p.player_type.class.should == Human
  end

  describe "#choosing moves" do
  	it "should be able to get a move from a human player type" do
      fake_human = double('human') # Why am I not stubbing :gets here?
      fake_human.stub(:choose_move).and_return(1)
      p = Player.new("X", fake_human)
  		p.get_player_move.should == 1
  	end

  	it "should be able to get a move from a computer player type" do
  		p = Player.new("O", Computer.new)
  		p.get_player_move.should be_an(Integer)
  	end
  end
end
