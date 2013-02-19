require 'spec_helper'

describe Computer do
	let (:output) {output = double('output').as_null_object}
	

	context "creation" do
    let (:computer) { Computer.new("X") }
		it "should know its own mark" do
			computer.mark = "X"
			computer.mark.should == "X"
		end
	end

  describe "score_move" do
    let (:computer) { Computer.new("X") }
    it "should return -1 for a board that is won by a player" do
      board = Board.new(["X","X","X","O","X","O","O","O","X"], output)
      current_player = "X"
      computer.score_move(board, current_player, 1).should == -1
    end

    it "should return 0 for a board that is a stalemate" do
      board = Board.new(["X","O","O","O","X","X","X","X","O"], output)
      current_player = "X"
      computer.score_move(board, current_player, 1).should == 0
    end

    it "should give a higher score to a lower depth" do
      depth1 = 1
      board = Board.new(["X","X","X","O","X","O","O","O","X"], output)
      current_player = "X"
      test_one = -computer.score_move(board, current_player, depth1)
      depth2 = 3
      test_two = -computer.score_move(board, current_player, depth2)
      test_one.should be > test_two
    end
  end

  context "making the winning move" do
    let (:computer) { Computer.new("X") }
  	it "should take the obvious winning move" do
  		board = Board.new([1,"X","X","O","X","O","O","O","X"], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 1
  	end

  	it "should choose a winning row move if it is available" do
  		board = Board.new(["X","X",3,4,"O",6,7,"O","O"], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 3
  	end

    it "should choose a winning column move if it is available" do
      board = Board.new(["X", 2, "O", "X", "O", 6, 7, 8, 9], output)
      computer.mark = "X"
      computer.minimax(board).should == 7
    end

  	it "should choose a winning diagonal move if it is available" do
  		board = Board.new([1,2,"X",4,"X","O","O","O","X"], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 1
  	end
  end

  context "tuning the algorithm" do
    let (:computer) { Computer.new("O") }

    it "should not return nil in situation number 1" do
      board = Board.new([1, "O", 3, "X", 5, 6, 7, 8, "X"], output)
      computer.mark = "O"
      computer.minimax(board).should_not be_nil
    end

    it "should take the win in situation number 2" do
      board = Board.new(["X", 2, "X", "O", "O", 6, "X", 8, 9], output)
      computer.mark = "O"
      computer.minimax(board).should == 6
    end
  end

  describe "scorimax" do
    let (:computer) { Computer.new("O") }
    it "should not take a side on its first move" do
      board = Board.new(["X", 2, 3, 4, 5, 6, 7, 8, 9], output)
      computer.mark = "O"
      computer.minimax(board).should_not == 2 || 4 || 6 || 8
    end

    it "should choose a win over a block" do
      board = Board.new(["X", "X", 3, 4, "X", 6, "O", "O", 9], output)
      computer.mark = "O"
      computer.minimax(board).should == 9
    end

  end

end



