require 'spec_helper'

describe GameLoop do
  let (:output) {output = double('output').as_null_object}
  let (:game_loop) {GameLoop.new(output)}

  it "should initialize with a new game" do
    game_loop.game.should be_true
  end

  it "should be able to start the loop" do
    game_loop.main
  end

  # it "should be able to start the game" do
  #   output.should_receive(:puts).with('Tic-Tac-Toe Time!')
  #   output.should_receive(:puts).with('Choose a space to occupy.')
  #   game_loop.start_game
  # end

  # it "should be able to get a player move" do
  #   game_loop.make_player_move.should be_true
  # end

  # it "should know if the game is over" do
  #   game_loop.is_over?.should be_false
  # end

  # it "should be able to cycle players" do
  #   game_loop.cycle_players.should be_true
  # end

end
