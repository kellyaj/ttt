class GameLoop

  attr_reader :game

  def initialize(output)
    @output = output
    @game = Game.new(@output)
  end


  def loop
    @game.start
    until game.is_over?
      @game.place_move
      @game.cycle_players
    end
    @game.play_again?
  end

  # def start_game
  #   @game.start
  # end

  # def make_player_move
  #   @game.place_move
  # end

  # def is_over?
  #   @game.is_over?
  # end

  # def cycle_players
  #   @game.cycle_players
  # end

end