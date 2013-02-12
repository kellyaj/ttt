require 'pry'
class Game

  attr_reader :board, :current_player

  def initialize(output, board = [1,2,3,4,5,6,7,8,9], input = $stdin, player1, player2)
    @output, @input = output, input
    @board = Board.new(board, output)
    @scorer, @printer = Scorer.new, BoardPrinter.new(output)
    @player1, @player2 = player1, player2
    @current_player = @player1
    @player1.mark, @player2.mark = "X", "O"
    @players_array = [@player1, @player2]
  end

  def print_board
    @printer.print_board(@board.positions, 3, 3) 
  end

  def welcome_message
    @output.puts 'Tic-Tac-Toe Time!'
  end

  def get_player_move
    player_move = @current_player.get_player_move(@board.available_spots)
  end

  def place_move
    @board.place_move(get_player_move, @current_player.mark)
  end

  def is_over?
    winner_message if @scorer.game_over?(@board)
    @scorer.game_over?(@board)
  end

  def cycle_players
    @current_player = @players_array.reverse!.first
  end

  def winner_message
    @output.puts("#{@current_player.mark} has won the game")
  end

end
