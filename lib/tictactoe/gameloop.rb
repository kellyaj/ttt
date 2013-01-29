class GameLoop

  def initialize(output)
    @output = output
    @player = Player.new("X")
    @computer = Computer.new("O")
    @board = Board.new([1,2,3,4,5,6,7,8,9], output)
    @scorer = Scorer.new
    @printer = BoardPrinter.new(output)
  end

  def start
    @output.puts 'Tic-Tac-Toe Time!'
    @output.puts 'Choose a space to occupy.'
  end

  def get_player_mark
    @player.mark
  end

  def get_board_positions
    @board.positions
  end

  def get_computer_mark
    @computer.mark
  end

  def get_player_move
    player_move = 1
    @board.place_is_taken?(player_move) ? @output.puts("That space is occupied.") : player_move
  end

  def place_move
    @board.place_move(get_player_move, get_player_mark)
    @board.place_move(@computer.computer_choose_move, get_computer_mark)
  end

  def is_over?
    @scorer.is_won?(@board) || @scorer.is_stalemate?(@board)
  end

end
