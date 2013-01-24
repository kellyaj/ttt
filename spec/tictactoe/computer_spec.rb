require 'spec_helper'

describe Computer do
  it "should initialize with a mark" do
    c = Computer.new("O")
    c.computer_player.should == "O"
  end
end
