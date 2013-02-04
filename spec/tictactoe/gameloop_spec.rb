require 'spec_helper'
require 'stringio'

describe GameLoop do
  let (:output) {output = double('output').as_null_object}
  #let (:game_loop) {GameLoop.new(output)}
 

  it "should receive a message asking to play again" do
  	output.should_receive(:puts).with('Would you like to play again? Yes or no')
  	GameLoop.new(output, StringIO.new("No"))
  end

  it "should play again if the response is yes" do
  	GameLoop.new(output, StringIO.new("Yes"))
  end

end
