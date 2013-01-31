class GameLoop

  attr_reader :game

  def initialize(output)
    @output = output
    @game = Game.new(@output)
    self.main 
  end

  def main
    @game.start
    until game.is_over?
      @game.print_board
      @game.place_move
      @game.cycle_players
    end
    #initialize if @game.play_again?
  end


end