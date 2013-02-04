require 'spec_helper'

describe GameLoop do
  let (:output) {output = double('output').as_null_object}
  let (:game_loop) {GameLoop.new(output)}

  # xit "should initialize with a new game" do
  #   game_loop.game.should be_true
  # end
  
  # it "should be able to start the loop" do
  #   game_loop.main
  # end

end
