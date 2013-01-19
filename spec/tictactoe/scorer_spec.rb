require 'spec_helper'
require 'scorer'

describe Scorer do
  describe "#is_won_row?" do
    it "can score a won row" do
      Scorer.new.is_won_row?(['X', 'X', 'X']).should == true
    end

    it "can determine a row is not won" do
      Scorer.new.is_won_row?(['O', 'X', 'O']).should == false
      Scorer.new.is_won_row?(['O', 5, 'O']).should == false
    end
  end

  describe "#is_won?" do
    it "can determine if any row in a board is won" do
      board = Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      Scorer.new.is_won?(board).should == false
    end
  end
end
