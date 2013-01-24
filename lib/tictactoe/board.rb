class Board

  attr_reader :positions

  def initialize(board)
    @positions = board
  end

  def horizontal_rows
    rows = []
    rows << @positions.slice(0, 3)
    rows << @positions.slice(3, 3)
    rows << @positions.slice(6, 3)
    rows
  end

  def vertical_rows
    rows = []
    rows << [@positions[0], @positions[3], @positions[6]]
    rows << [@positions[1], @positions[4], @positions[7]]
    rows << [@positions[2], @positions[5], @positions[8]]
    rows
  end

  def diagonal_rows
    rows = []
    rows << [@positions[0], @positions[4], @positions[8]]
    rows << [@positions[2], @positions[4], @positions[6]]
    rows
  end
  
  def place_human_move(player_move, player_mark)
    @positions[player_move - 1] = player_mark
  end

end
