class Output
  
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

end

def output
    @output ||= Output.new
end

Given /^that the game has just begun$/ do
  require 'stringio'
  @input = "1" #\n4\n2\n5\n3\nno"
  @player1 = Player.new(Computer.new("X"))
  @player2 = Player.new(Computer.new("O"))
  @new_game = Game.new(@output, [1, 2, 3, 4, 5, 6, 7, 8, 9], @input, @player1, @player2)
end

When /^it is a players turn$/ do
  # nothing
end

Then /^the player should be able to (\d+) select a space\.$/ do |arg1|
  @new_game.get_player_move.should_not be_nil
end