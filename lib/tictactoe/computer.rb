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

  def minimax(board, depth = 0)
    current_player = @mark
    depth += 1
    prime_move = -1
    highest_score = -1
    board.available_spots.each do |spot| 
      board.place_move(spot, current_player) 
      game_status = @scorer.game_over?(board)
      spot_score = scorimax(board, depth, cycle_players(current_player))
      board.positions[spot-1] = spot 
      if spot_score > highest_score || game_status
        prime_move = spot
        highest_score = spot_score
      end
    end
    return prime_move
  end

  def scorimax(board, depth, current_player) 
    spot_score = -1
    return score_move(board, current_player) if @scorer.game_over?(board)
    board.available_spots.each do |spot|
      board.place_move(spot, current_player)
      spot_score = scorimax(board, depth, cycle_players(current_player))
      board.positions[spot-1] = spot
    end
    return spot_score
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

