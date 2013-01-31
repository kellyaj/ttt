require 'spec_helper'

describe Game do

  let (:output) {output = double('output').as_null_object}
  let (:g) {Game.new(output)}

  describe "#initialize"  do
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
      output.should_receive(:puts).with('Tic-Tac-Toe Time!')
      g.start
    end

    it "should prompt the user to move" do
      output.should_receive(:puts).with('Choose a space to occupy.')
      g.start
    end
  end

  describe "#game loop" do
    it "should know that the game is not over at the beginning" do
      g.is_over?.should == false
    end

   it "should prompt the player to play again at the end" do
     g.board.positions[0] = "X"
     g.board.positions[1] = "X"
     g.board.positions[2] = "X"
     g.is_over?.should == true
     output.should_receieve(:puts).with("Would you like to play again? yes or no")
     g.play_again?
    end


    describe "#moves" do
      it "should get a player move after prompt" do
        g.get_player_move.should_not be_nil
      end

      it "should puts a rejection message if the place is taken" do
        output.should_receive(:puts).with('That space is occupied.')
        g.place_move
        g.get_board_positions.should include("X")
        g.place_move
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