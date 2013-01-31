class GameLoop

  attr_reader :game

  def initialize(output)
    @output = output
    @game = Game.new(@output)
  end

  def main
    @game.start
    until game.is_over?
      @game.place_move
      @game.cycle_players
    end
    @game.play_again?
  end

end