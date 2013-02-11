require 'pry'
class GameLoop

  attr_reader :game

  def initialize(output, input = $stdin)
    @output = output
    @input = input
    choose_player_type ? @player1 = Player.new("X", Human.new) : nil
    @game = Game.new(@output, [1, 2, 3, 4, 5, 6, 7, 8, 9], @input, @player1, nil) # extract this to a method
  end

  def main(game)
    game.welcome_message
    while !game.is_over?
      game.print_board
      game.place_move
      break if game.is_over?
      game.cycle_players
    end
    self.main(Game.new(@output, [1, 2, 3, 4, 5, 6, 7, 8, 9], @input, @player1, nil)) if play_again?
  end

  def play_again?
    @output.puts 'Would you like to play again? Yes or no'
    response = @input.gets.chomp
    response.downcase
    response == "yes"
  end

  def choose_player_type
    @output.puts "Type 'human' if you would like to play."
    response = @input.gets.chomp
    response.downcase
    response == "human"
  end

  def start_game
    self.main(@game)
  end

end