class Scorer
  def is_won_row?(row)
    values = row.uniq
    values.length == 1
  end

  def is_won?(board)
    board.horizontal_rows.concat(board.vertical_rows).concat(board.diagonal_rows).any? {|row| is_won_row?(row)}
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
