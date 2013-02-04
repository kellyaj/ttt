require 'pry'
class BoardPrinter

  def initialize(output)
    @output = output
  end

  def print_board(board)
    board = horizontal_rows(board)
    @output.puts "    " + board[0].join("   |   ")
    @output.puts "   " + "-------------------"
    @output.puts "    " + board[1].join("   |   ")
    @output.puts "   " + "-------------------"
    @output.puts "    " + board[2].join("   |   ")
    @output.puts "\n\n"
  end

  def horizontal_rows(board)
    rows = []
    rows << board.slice(0, 3) << board.slice(3, 3) << board.slice(6, 3)
  end
end
