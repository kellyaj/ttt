require 'spec_helper'

describe Board do

  describe "#initialize" do
    it "should initialize with a board" do
      spaces = [1,2,3,4,5,6,7,8,9]
      board = Board.new spaces
      board.positions.should == spaces
    end
  end

  describe "#rows" do
    before(:each) do
      @board = Board.new [1,2,3,4,5,6,7,8,9]
    end

    it "should give me the horizontal rows on the board" do
      rows = @board.horizontal_rows
      rows.length.should == 3
      rows.should include([1, 2, 3])
      rows.should include([4, 5, 6])
      rows.should include([7, 8, 9])
    end

    it "should give me the vertical rows from the board" do
      rows = @board.vertical_rows
      rows.length.should == 3
      rows.should include([1, 4, 7])
      rows.should include([2, 5, 8])
      rows.should include([3, 6, 9])
    end

    it "should give me the diagonal rows from the board" do
      rows = @board.diagonal_rows
      rows.length.should == 2
      rows.should include([1, 5, 9])
      rows.should include([3, 5, 7])
    end
  end

end
