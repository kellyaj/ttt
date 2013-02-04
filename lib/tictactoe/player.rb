require 'pry'
class Player

  attr_reader :mark, :player_type

  def initialize(mark, player_type)
    @mark = mark
    @player_type = player_type
  end

  def get_player_move # also pass in empty positions
  	@player_type.choose_move
  end

end
