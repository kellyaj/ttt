require 'spec_helper'
require 'stringio'

describe Game do

  let (:output) {output = double('output').as_null_object}

  describe "#initialize"  do
    let (:g) {Game.new(output)}
    it "should initialize a player with mark X" do
      g.get_player_mark.should == "X"
    end

    it "should initialize with a new board" do
      g.get_board_positions.should == [1,2,3,4,5,6,7,8,9]
    end
  end

  describe "#game start" do
    let (:g) {Game.new(output)}
    it "should have a welcome message" do
      output.should_receive(:puts).with('Tic-Tac-Toe Time!')
      g.welcome_message
    end
  end

  describe "#game loop" do
    let (:g) {Game.new(output)}
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

    it "should be able to cycle players" do
      g.cycle_players
      g.current_player.mark.should == "O"
    end

    it "should report who won the game" do
      g.board.positions[0] = "X"
      g.board.positions[1] = "X"
      g.board.positions[2] = "X"
      output.should_receive(:puts).with("A player has won the game")
      g.is_over?.should == true
    end


    describe "#moves" do
      it "should get a player move after prompt" do
        g = Game.new(output, [1,2,3,4,5,6,7,8,9], StringIO.new("1"))
        g.get_player_move.should_not be_nil
      end

      xit "should puts a rejection message if the place is taken" do
        g = Game.new(output, [1,2,3,4,5,6,7,8,9], StringIO.new("1"))
        output.should_receive(:puts).with('That space is occupied.')
        g.place_move
        g.get_board_positions.should include("X")
        g.place_move
      end

      it "should place the players move onto the board" do
        g = Game.new(output, [1,2,3,4,5,6,7,8,9], StringIO.new("1"))
        g.place_move
        g.get_board_positions.should include("X")
      end

      it "should place the computers move onto the board" do
        g = Game.new(output)
        g.cycle_players
        g.place_move
        g.get_board_positions.should include("O")
      end

      it "should know who the current player is at the beginning of the game" do
        g = Game.new(output)
      	g.current_player.mark.should == "X"
      end
    end

  end

end