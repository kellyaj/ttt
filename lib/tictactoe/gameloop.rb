class GameLoop

  attr_accessor :game

  def initialize(output, input = $stdin)
    @output = output
    @input = input
    assign_players(choose_player_type("first"), choose_player_type("second"))
    create_game
  end

  def main(game)
    game.welcome_message
    while !game.is_over?
      game.print_board
      game.place_move
      if game.is_over?
        game.print_board
        break
      end
      game.cycle_players
    end
    self.main(create_game) if play_again?
  end

  def create_game(board_size = 3)
    if board_size == 3
      @game = Game.new(@output, [1, 2, 3, 4, 5, 6, 7, 8, 9], @input, @player1, @player2)
    else
      @game = Game.new(@output, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], @input, @player1, @player2)
    end
  end

  def play_again?
    @output.puts "Would you like to play again? 'yes' or 'no'"
    response = @input.gets.chomp
    response.downcase
    response == "yes"
  end

  def choose_player_type(turn)
    @output.puts "The #{turn} player is a... 'human' or 'computer'"
    response = @input.gets.chomp
    response.downcase
    response == "human"
  end

  def start_game
    self.main(@game)
  end

  def assign_players(player1, player2)
    player1 ? @player1 = Player.new(Human.new) : @player1 = Player.new(Computer.new("X"))
    player2 ? @player2 = Player.new(Human.new) : @player2 = Player.new(Computer.new("O"))
  end

end