class Computer < Player

	def initialize
		super()
	end
	
  def choose_move(board)
  	board.available_spots.sample
  end

  def check_for_win(available_spots)
  end
end
