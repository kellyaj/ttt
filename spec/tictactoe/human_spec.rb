require 'spec_helper'

describe "Human" do
	describe "#move" do
		let (:human) { Human.new }
		let (:available_spots) { [2,3,4,6,7,8,9] }
		it "should be able to check that a player's choice is a valid move" do
			human.stub(:gets).and_return("1")
			user_input = human.choose_move(available_spots)
			human.valid_move?(user_input, available_spots).should be_false
		end
	end
end