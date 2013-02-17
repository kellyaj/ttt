require_relative 'scorer.rb'
require 'pry'

class Computer < Player

	def initialize
		super(self)
		@scorer = Scorer.new
	end
	
  def choose_move(board)
    minimax(board)
    # return an integer 
  end

  def minimax(board)
    current_player = @mark
    return scorimax(board, current_player).last
  end

  def scorimax(board, current_player) 
    spot_score = -1
    prime_move = nil
    highest_score = -1
    return score_move(board, current_player), nil if @scorer.game_over?(board)
    board.available_spots.each do |spot|
      # if current = @mark find highest
      # if current = other find lowest
      board.place_move(spot, current_player)
      spot_score = scorimax(board, cycle_players(current_player)).first
      board.positions[spot-1] = spot
      if spot_score > highest_score
        prime_move = spot
        highest_score = spot_score
      end
    end
    return highest_score, prime_move
  end

  def score_move(board, current_player)
  	if current_player == @mark && @scorer.is_won?(board)
  		1
  	elsif @scorer.is_stalemate?(board)
  		0
    else
      -1
  	end
  end

  def cycle_players(current_player)
    if current_player == "X"
      "O"
    else
      "X"
    end
  end

end

