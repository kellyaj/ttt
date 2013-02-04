require 'spec_helper'

describe Board do

  let (:output) {output = double('output').as_null_object}

  describe "#initialize" do
    it "should initialize with a board" do
      spaces = [1,2,3,4,5,6,7,8,9]
      board = Board.new(spaces, output)
      board.positions.should == spaces
    end
  end

  describe "#rows" do
    before(:each) do
      @board = Board.new([1,2,3,4,5,6,7,8,9], output)
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

  describe "#moves" do
    it "should be able to place a human move" do
      board = Board.new([1,2,3,4,5,6,7,8,9], output)
      player_move = 5
      player_mark = "X"
      board.place_move(player_move, player_mark)
      board.positions[4].should == "X"
    end

    it "should be able to check if a spot is not taken" do
      board = Board.new([1,2,3,4,5,6,7,8,9], output)
      board.place_is_taken?(1).should == false
    end

    it "should be able to check if a spot is occupied" do
      board = Board.new(["X",2,3,4,5,6,7,8,9], output)
      board.place_is_taken?(1).should == true
    end

    it "should know which spots are available" do
      board = Board.new(["X",2,3,4,5,6,7,8,9], output)
      board.available_spots.should == [2,3,4,5,6,7,8,9]
    end
  end


end
