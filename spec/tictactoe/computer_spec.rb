require 'spec_helper'

describe Computer do
	let (:output) {output = double('output').as_null_object}
	let (:computer) { Computer.new }

	context "creation" do
		it "should know its own mark" do
			computer.mark = "X"
			computer.mark.should == "X"
		end
	end

  describe "choose_move" do
    xit "should be able to make a move" do
    	board = Board.new([1,2,3,4,5,6,7,8,9], output)
      computer.choose_move(board).should be > 0
      computer.choose_move(board).should be < 10
    end
  end

  describe "score_move" do
    xit "should return 1 for a board that is won by a player" do
      board = Board.new(["X","X","X","O","X","O","O","O","X"], output)
      computer.score_move(board).should == 1
    end

    xit "should return 1 for a board that is a column based win" do
      board = Board.new(["X", 2, "O", "X", "O", 6, "X", 8, 9], output)
      computer.score_move(board).should == 1
    end

    xit "should return -1 for a board that is not won by a player" do
      board = Board.new([1,"X","X","O","X","O","O","O","X"], output)
      computer.score_move(board).should == -1
    end

    xit "should return 0 for a board that is a stalemate" do
      board = Board.new(["X","O","O","O","X","X","X","X","O"], output)
      computer.score_move(board).should == 0
    end
  end

  context "making the winning move" do

  	xit "should take the obvious winning move" do
  		board = Board.new([1,"X","X","O","X","O","O","O","X"], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 1
  	end

  	xit "should always choose a winning row move if it is available" do
  		board = Board.new(["X","X",3,4,"O",6,7,"O","O"], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 3
  	end

  	xit "should always choose a winning column move if it is available" do
  		board = Board.new(["X",2,3,"X",5,6,7,8,9], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 7
  	end

  	xit "should always choose a winning diagonal move if it is available" do
  		board = Board.new([1,2,"X",4,"X","O","O","O","X"], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 1
  	end

  	xit "should always choose a winning alternate row move if it is available" do
  		board = Board.new([1,2,3,"X","X",6,7,8,9], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 6
  	end
  end
  context "making a blocking move" do
  	xit "should always choose a row block if available" do
  		board = Board.new(["X",2,3,"O","O",6,7,"X",9], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 6
  	end

  	xit "should always choose a column block if available" do
  		board = Board.new(["O",2,3,"O",5,6,7,8,9], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 7
  	end

  	xit "should always choose a diagonal block if available" do
  		board = Board.new(["O",2,3,4,"O",6,7,8,9], output)
  		computer.mark = "X"
  		computer.minimax(board).should == 9
  	end
  end

  context "tuning the algorithm" do
    it "should not lose in situation number 1" do
      # Human chose 5, he chose 8, human chooses 9 for the win
      #  X has won the game
      #  X   |   X   |   O
      # -------------------
      #  4   |   X   |   6
      # -------------------
      #  O   |   O   |   X
      board = Board.new(["X", "X", "O", 4, "X", 6, "O", 8, 9], output)
      computer.mark = "O"
      computer.minimax(board).should == 9
    end
  end

end


# Tic-Tac-Toe Time!
#     1   |   2   |   3
#    -------------------
#     4   |   5   |   6
#    -------------------
#     7   |   8   |   9


# Choose a space to occupy.
# Available moves: [1, 2, 3, 4, 5, 6, 7, 8, 9]
# 1
#     X   |   2   |   3
#    -------------------
#     4   |   5   |   6
#    -------------------
#     7   |   8   |   9


#     X   |   2   |   3
#    -------------------
#     4   |   5   |   6
#    -------------------
#     O   |   8   |   9


# Choose a space to occupy.
# Available moves: [2, 3, 4, 5, 6, 8, 9]
# 2
#     X   |   X   |   3
#    -------------------
#     4   |   5   |   6
#    -------------------
#     O   |   8   |   9


#     X   |   X   |   O
#    -------------------
#     4   |   5   |   6
#    -------------------
#     O   |   8   |   9


# Choose a space to occupy.
# Available moves: [4, 5, 6, 8, 9]
# 5
#     X   |   X   |   O
#    -------------------
#     4   |   X   |   6
#    -------------------
#     O   |   8   |   9


#     X   |   X   |   O
#    -------------------
#     4   |   X   |   6
#    -------------------
#     O   |   O   |   9


# Choose a space to occupy.
# Available moves: [4, 6, 9]
# 9
# X has won the game
#     X   |   X   |   O
#    -------------------
#     4   |   X   |   6
#    -------------------
#     O   |   O   |   X



