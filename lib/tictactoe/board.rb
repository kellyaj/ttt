class Board

  attr_reader :positions

  def initialize(board, output)
    @positions = board
    @output = output
  end

  # add a method that gets the rows, to eventually be passed to Scorer

  def horizontal_rows
    rows = []
    rows << @positions.slice(0, 3) 
    rows << @positions.slice(3, 3) 
    rows << @positions.slice(6, 3)
  end

  def vertical_rows
    rows = []
    rows << [@positions[0], @positions[3], @positions[6]] 
    rows << [@positions[1], @positions[4], @positions[7]] 
    rows << [@positions[2], @positions[5], @positions[8]]
  end

  def diagonal_rows
    rows = []
    rows << [@positions[0], @positions[4], @positions[8]] 
    rows << [@positions[2], @positions[4], @positions[6]]
  end

  def place_move(move, mark)
    @positions[move - 1] = mark
  end

  def place_is_taken?(place)
    @positions[place - 1] == ("X" || "O")
  end

  def available_spots
    untaken_positions = []
    @positions.each do |position|
      unless position == ("X" || "O")
        untaken_positions << position
      end
    end
    untaken_positions
  end

end
