require 'spec_helper'

describe GameLoop do

  let (:output) {output = double('output').as_null_object}
  let (:g) {GameLoop.new(output)}

  describe "#initialize" do
    it "should initialize a player with mark X" do
      g.get_player_mark.should == "X"
    end

    it "should initialize a computer with mark O" do
      g.get_computer_mark.should == "O"
    end

    it "should initialize with a new board" do
      g.get_board_positions.should == [1,2,3,4,5,6,7,8,9]
    end
  end

  describe "#game start" do
    it "should have a welcome message" do
      output.should_receieve(:puts).with('Tic-Tac-Toe Time!')
      g.start
    end

    it "should prompt the user to move" do
      output.should_receive(:puts).with('Choose a space to occupy.')
      g.start
    end
  end

  describe "#game loop" do
    describe "#moves" do
      it "should get a player move after prompt" do
        g.get_player_move.should_not be_nil
      end

      it "should place the players move onto the board" do
        g.place_move
        g.get_board_positions.should include("X")
      end

     it "should place the computers move onto the board" do
       g.place_move
       g.get_board_positions.should include("O")
     end

    end
  end

end
