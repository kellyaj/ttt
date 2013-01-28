require 'pry'
class Scorer
  def is_won_row?(row)
    values = row.uniq
    values.length == 1
  end

  def is_won?(board)
    winner = false
    board.horizontal_rows.each do |row|
      if is_won_row?(row) == true
        winner = true
      end
    end
    board.vertical_rows.each do |row|
      if is_won_row?(row) == true
        winner = true
      end
    end
    board.diagonal_rows.each do |row|
      if is_won_row?(row) == true
        winner = true
      end
    end
    winner
  end

  def is_stalemate?(board)
    current_board = board.positions
    current_board.collect! {|y| y.to_i}
    if current_board.inject(:+) == 0
      true
    else
      false
    end
  end
end
