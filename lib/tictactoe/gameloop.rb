require 'pry'
class GameLoop

  attr_reader :game

  def initialize(output)
    @output = output
    self.main(Game.new(@output))
  end

  def main(game)
    game.welcome_message
    while !game.is_over?
      game.print_board
      game.place_move
      game.cycle_players
    end
    self.main(Game.new(@output)) if game.play_again?
  end

end