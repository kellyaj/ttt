class Scorer
  def is_won_row?(row)
    values = row.uniq
    values.length == 1
  end

  def is_won?(board)
    board.get_rows.any? {|row| is_won_row?(row)}
  end

  def is_stalemate?(board)  
    board.positions.map(&:to_i).inject(:+) == 0
  end

end
