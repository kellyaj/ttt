require 'spec_helper'
require 'stringio'

describe GameLoop do
  let (:output) {output = double('output').as_null_object}
    
  it "should play again if the response is yes" do 
  	game_loop = GameLoop.new(output, StringIO.new("computer\ncomputer\nyes"))
  	game_loop.play_again?.should be_true
  end

  it "should allow a human to decide who plays" do
    new_game_loop = GameLoop.new(output, StringIO.new("human\nhuman"))
    new_game_loop.game.current_player.player_type.should be_a(Human)
  end

end
