class Computer

  attr_reader :mark
   
  def initialize(mark)
    @mark = mark
  end

  def computer_player
    @mark
  end

  def computer_choose_move
    rand 1..9
  end

end
