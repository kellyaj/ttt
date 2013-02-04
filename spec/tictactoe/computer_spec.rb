require 'spec_helper'

describe Computer do
  describe "#moving" do
    it "should be able to make a move" do
    	available_positions = [1,2,3,4,5,6,7,8,9]
      c = Computer.new
      c.choose_move(available_positions).should be_an(Integer)
    end
  end
end
