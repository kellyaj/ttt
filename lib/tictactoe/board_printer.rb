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
    rows << board.slice(0, 3) << board.slice(3, 3) << board.slice(6, 3)
  end
end
