require 'pry'
class Scorer
  def is_won_row?(row)
    values = row.uniq
    values.length == 1
  end

  def is_won?(board)
    winner = false
    winner = true if  board.horizontal_rows.collect {|row| is_won_row?(row)}.include?(true) || board.vertical_rows.collect {|row| is_won_row?(row)}.include?(true) || board.diagonal_rows.collect {|row| is_won_row?(row)}.include?(true)
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
