require 'spec_helper'
require 'stringio'

describe Game do

  let (:output) {output = double('output').as_null_object}
  let (:cpu1) { Player.new(Computer.new)} # need to adjust these for Computer's new arg
  let (:cpu2) { Player.new(Computer.new)}
  let (:human) { Player.new(Human.new)}

  describe "#initialize"  do
  let (:g) {Game.new(output, [1, 2, 3, 4, 5, 6, 7, 8, 9], $stdin, cpu1, cpu2)}

    it "should initialize with a new board" do
      g.board.positions.should == [1,2,3,4,5,6,7,8,9]
    end
  end

  describe "#game start" do
  let (:g) {Game.new(output, [1, 2, 3, 4, 5, 6, 7, 8, 9], $stdin, cpu1, cpu2)}

    it "should have a welcome message" do
      output.should_receive(:puts).with('Tic-Tac-Toe Time!')
      g.welcome_message
    end
  end

  describe "#game loop" do
    it "should know that the game is not over at the beginning" do
      g = Game.new(output, [1, 2, 3, 4, 5, 6, 7, 8, 9], $stdin, cpu1, cpu2)
      g.is_over?.should == false
    end

    it "should be able to cycle players" do
      g = Game.new(output, [1, 2, 3, 4, 5, 6, 7, 8, 9], $stdin, cpu1, cpu2)
      g.cycle_players
      g.current_player.mark.should == "O"
    end

    it "should report who won the game" do
      g = Game.new(output, [1, 2, 3, 4, 5, 6, 7, 8, 9], $stdin, cpu1, cpu2)
      g.board.positions[0] = "X"
      g.board.positions[1] = "X"
      g.board.positions[2] = "X"
      output.should_receive(:puts).with('X has won the game')
      g.is_over?.should == true
    end
  end

  describe "#moves" do
  let (:g) {Game.new(output, [1, 2, 3, 4, 5, 6, 7, 8, 9], $stdin, cpu1, cpu2)}

    it "should get a player move after prompt" do
      g.get_player_move.should_not be_nil
    end

    it "should place the players move onto the board" do
      g.place_move
      g.board.positions.should include("X")
    end

    it "should place the computers move onto the board" do
      g.cycle_players
      g.place_move
      g.board.positions.should include("O")
    end

    it "should know who the current player is at the beginning of the game" do
    	g.current_player.mark.should == "X"
    end 
  end

  describe "#board injection" do
    it "should accept an injected board" do
      g = Game.new(output, ["X", "O", 3, 4, 5, 6, 7, 8, 9], $stdin, cpu1, cpu2)
      g.board.positions.should include("X" && "O")
    end
  end

end