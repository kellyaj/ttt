require 'pry'
class GameLoop

  attr_reader :game

  def initialize(output, input = $stdin)
    @output = output
    @input = input
    @game = Game.new(@output, [1, 2, 3, 4, 5, 6, 7, 8, 9], $stdin, nil, nil)
    self.main(@game)
  end

  def main(game)
    game.welcome_message
    while !game.is_over?
      game.print_board
      game.place_move
      break if game.is_over?
      game.cycle_players
    end
    self.main(Game.new(@output, [1,2,3,4,5,6,7,8,9], $stdin, nil, nil)) if play_again?
  end

  def play_again?
    @output.puts 'Would you like to play again? Yes or no'
    response = @input.gets.chomp
    response.downcase
    response == "yes"
  end

end