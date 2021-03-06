class Board

  attr_reader :positions

  def initialize(board, output)
    @positions = board 
    @output = output
  end

  def get_rows
    # board.horizontal_rows.concat(board.vertical_rows).concat(board.diagonal_rows).any? {|row| is_won_row?(row)}
    rows = []
    rows << @positions.slice(0, 3)
    rows << @positions.slice(3, 3)
    rows << @positions.slice(6, 3)
    rows << [@positions[0], @positions[3], @positions[6]]
    rows << [@positions[1], @positions[4], @positions[7]]
    rows << [@positions[2], @positions[5], @positions[8]]
    rows << [@positions[0], @positions[4], @positions[8]]
    rows << [@positions[2], @positions[4], @positions[6]]
    rows
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

  def place_move(move, mark)
    @positions[move - 1] = mark
  end

  def place_is_taken?(place)
    @positions[place - 1] == ("X" || "O")
  end 

  def available_spots
    @positions.select { |spot| spot.to_s =~ /\d/ }
  end

end
