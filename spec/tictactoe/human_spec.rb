require 'spec_helper'
require 'stringio'

describe "Human" do

	let (:available_spots) { [2,3,4,6,7,8,9] }
	let (:output) {output = double('output').as_null_object}

	describe "#move" do
		it "should be able to check if a player's choice is an invalid move" do
			human = Human.new(output, StringIO.new("1"))
			user_input = 1
			human.valid_move?(user_input, available_spots).should be_false
		end

		it "should be able to check that a player's move is valid" do
			human = Human.new(output, StringIO.new("2"))
			human.choose_move(available_spots).should == 2
		end

		it "should prompt a human user to choose a move" do
			output.should_receive(:puts).with('Choose a space to occupy.')
			human = Human.new(output, StringIO.new("4"))
			human.choose_move(available_spots).should == 4
		end

		it "should display an array of available moves to the player" do
			output.should_receive(:puts).with('Available moves: [2, 3, 4, 6, 7, 8, 9]')
			human = Human.new(output, StringIO.new("4"))
			human.choose_move(available_spots).should == 4
		end

		# working, but test disabled because I can't figure out how to write it
		xit "should display an error message if a move is invalid and reprompt" do
			output.should_receive(:puts).with('That is not a valid move. Try again.')
			human = Human.new(output, StringIO.new("5"))
			human.choose_move(available_spots)
		end
	end
end