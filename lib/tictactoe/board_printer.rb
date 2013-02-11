require 'pry'
class BoardPrinter

  def initialize(output)
    @output = output
  end

  def print_board(board)
    # check for is_last rows.last?
    rows = horizontal_rows(board)
    rows.each do |row|
      @output.puts "    " + row.join("   |   ")
      @output.puts "   " + "-------------------"
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
