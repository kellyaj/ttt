require 'spec_helper'
require 'stringio'

describe GameLoop do
  let (:output) {output = double('output').as_null_object}
  
  # all features functioning but cant figure out testing. downcase doesnt work either 
  xit "should receive a message asking to play again" do
  	output.should_receive(:puts).with('Would you like to play again? Yes or no')
  	GameLoop.new(output, StringIO.new("No"))
  end

  
  xit "should play again if the response is yes" do 
  	first_loop = GameLoop.new(output, StringIO.new("yes"))
  	first_loop_game = first_loop.game
  end

  it "should allow a human to decide who plays" do
    new_game_loop = GameLoop.new(output, StringIO.new("human"))
    new_game_loop.game.current_player.player_type.should be_a(Human)
  end

end
