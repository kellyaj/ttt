class Computer

  attr_reader :mark
   
  def initialize(mark)
    @mark = mark
  end

  def computer_player
    @mark
  end

end
