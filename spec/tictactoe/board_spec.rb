require 'spec_helper'

describe Board do

  describe "#initialize" do
    it "should initialize with a board" do
      b = Board.new([1,2,3,4,5,6,7,8,9])
      b.positions.should == [1,2,3,4,5,6,7,8,9]
    end

  end


end
