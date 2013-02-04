require 'spec_helper'
require 'stringio'

describe "Human" do
	describe "#move" do
		let (:available_spots) { [2,3,4,6,7,8,9] }

		it "should be able to check that a player's choice is an invalid move" do
			human = Human.new(StringIO.new("1"))
			user_input = human.choose_move(available_spots)
			human.valid_move?(user_input, available_spots).should be_false
		end

		it "should be able to check that a player's move is valid" do
			human = Human.new(StringIO.new("2"))
			human.choose_move(available_spots).should == 2
		end
	end
end