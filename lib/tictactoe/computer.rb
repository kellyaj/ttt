require_relative 'scorer.rb'
require 'pry'

class Computer < Player

	def initialize
		super(self)
		@scorer = Scorer.new
	end
	
  def choose_move(board)
    # minimax(board)
    # return an integer 
  end

# board.positions => 


  def minimax(board, depth = 0)
    depth += 1
    prime_move = -1
    highest_score = -1
    board.available_spots.each do |spot|
      board.place_move(spot, @mark)
      game_status = @scorer.game_over?(board)
      spot_score = scorimax(board, depth)
      board.positions[spot-1] = spot
      if spot_score > highest_score || game_status
        prime_move = spot
        highest_score = spot_score
      end
    end
    return prime_move
  end

  def scorimax(board, depth)
    spot_score = -1
    return score_move(board) if @scorer.game_over?(board) 
    board.available_spots.each do |spot|
      board.place_move(spot, @mark)
      spot_score = scorimax(board, depth)
      board.positions[spot-1] = spot
    end
    return spot_score
  end

  def score_move(board)
  	if @scorer.is_won?(board)
  		return 1
  	elsif @scorer.is_stalemate?(board)
  		return 0
  	else
  		return -1
  	end
  end

end

