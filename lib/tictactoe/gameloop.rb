class GameLoop

  attr_reader :game

  def initialize(output)
    @output = output
    @game = Game.new(@output)
  end

  def start_game
    @game.start
  end

  def make_player_move
    @game.place_move
  end

  def is_over?
    @game.is_over?
  end

end