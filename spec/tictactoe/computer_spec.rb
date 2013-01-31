require 'spec_helper'

describe Computer do
  describe "#moving" do
    it "should be able to make a move" do
      c = Computer.new
      c.choose_move.should be_an(Integer)
    end
  end
end
