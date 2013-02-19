require_relative 'scorer.rb'
require 'pry'

class Computer < Player

	def initialize(mark)
		super(self)
		@scorer = Scorer.new
    @mark = mark
	end
	
  def choose_move(board)
    minimax(board)
  end

  def minimax(board)
    current_player = @mark
    return scorimax(board, current_player).last
  end

  def scorimax(board, current_player, depth = 0)
    spot_score = -1
    prime_move = nil
    highest_score = -1
    depth = depth
    return score_move(board, current_player, depth), nil if @scorer.game_over?(board)
    depth += 1
    board.available_spots.each do |spot|
      board.place_move(spot, current_player)
      spot_score = -scorimax(board, cycle_players(current_player), depth).first
      board.positions[spot-1] = spot
      #binding.pry if depth == 1 && spot == 6
      if spot_score > highest_score 
        prime_move = spot
        highest_score = spot_score
      end
    end
    return highest_score, prime_move
  end

  def score_move(board, current_player, depth)
  	if @scorer.is_won?(board)
      (1.0 / -depth)
  	else
      0
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

