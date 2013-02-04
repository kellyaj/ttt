require 'pry'
class Game

  attr_reader :board, :current_player

  def initialize(output, board = [1,2,3,4,5,6,7,8,9])
    @output = output
    @board = Board.new(board, output)
    @scorer = Scorer.new
    @printer = BoardPrinter.new(output)
    @player1 = Player.new("X", Human.new)
    @player2 = Player.new("O", Computer.new)
    @current_player = @player1
    @players_array = [@player1, @player2]
  end

  def print_board
    @printer.print_board(@board.positions) # now just passing in positions
  end

  def welcome_message
    @output.puts 'Tic-Tac-Toe Time!'
    @output.puts 'Choose a space to occupy.'
  end

  def get_player_mark
    @current_player.mark
  end

  def get_board_positions
    @board.positions
  end

  def get_computer_mark
    @computer.mark
  end

  def get_player_move
    player_move = @current_player.get_player_move(@board.available_spots)
    @board.place_is_taken?(player_move) ? @output.puts("That space is occupied.") : player_move
  end

  def place_move
    @board.place_move(get_player_move, get_player_mark)
  end

  def is_over?
    if @scorer.is_won?(@board) || @scorer.is_stalemate?(@board)
      winner_message
    end
    @scorer.is_won?(@board) || @scorer.is_stalemate?(@board)
  end

  def play_again?
    @output.puts 'Would you like to play again? Yes or no'
  end

  def cycle_players
    @current_player = @players_array.reverse!.first
  end

  def winner_message
    @output.puts("A player has won the game")
  end

end
