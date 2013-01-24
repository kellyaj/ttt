require 'spec_helper'

describe Computer do
  describe "#initialize" do
    it "should initialize with a mark" do
      c = Computer.new("O")
      c.computer_player.should == "O"
    end
  end

  describe "#moving" do
    it "should be able to make a random move" do
      c = Computer.new("O")
      c.computer_choose_move.should be_an(Integer)
    end
  end
end
