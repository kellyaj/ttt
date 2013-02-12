require 'pry'
class BoardPrinter

  def initialize(output)
    @output = output
  end

  def print_board(board_array, rows, columns) #
    rows.times do |n|
      @output.puts "    " + board_array.slice(n * rows, columns).join("   |   ")
      @output.puts "   " + "-------------------" unless n == rows - 1
    end
    @output.puts "\n\n"
  end

  def horizontal_rows(board)
    rows = []
    board_index = 0 
    (board.length / 3).times do 
      rows << board.slice(board_index, 3)
      board_index += 3
    end
    rows
  end
end
