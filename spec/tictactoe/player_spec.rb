require 'spec_helper'

describe Player do
  it "should initialize with a mark" do
    p = Player.new("X")
    p.human_player.should == "X"
  end
end
