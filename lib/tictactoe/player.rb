require 'pry'
class Player

  attr_accessor :mark, :player_type

  def initialize(player_type)
    @player_type = player_type
  end

  def get_player_move(available_spots)
  	@player_type.choose_move(available_spots)
  end

end
