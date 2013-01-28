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
   it "can determine that a new board is not won" do
      board = Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      Scorer.new.is_won?(board).should  be_nil
    end

    it "can determine that a horizontal win has occured" do
      board = Board.new ["X", "X", "X", 4, 5, 6, 7, 8, 9]
      Scorer.new.is_won?(board).should == true
    end

    it "can determine that a column win has occured" do
      board = Board.new ["X", 2, 3, "X", 5, 6, "X", 8, 9]
      Scorer.new.is_won?(board).should == true
    end

    it "can determine that a diagonal win has occured" do
      board = Board.new ["X", 2, 3, 4, "X", 6, 7, 8, "X"]
      Scorer.new.is_won?(board).should == true
    end
  end

  describe "#is stalemate?" do
   it "can determine if a board is a stalemate" do
      board = Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      Scorer.new.is_stalemate?(board).should == false
      stale_board = Board.new ["X","X","O","O","O","X","X","X","O"]
      Scorer.new.is_stalemate?(stale_board).should == true
    end
  end
end
