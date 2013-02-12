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

# computer vs computer game

Given /^that there are two computer players$/ do
  @cpu_game_loop = GameLoop.new(output, StringIO.new("cpu\ncpu\nno"))
  @cpu_game_loop.start_game
end

Then /^they should be able to play until the end\.$/ do
  @cpu_game_loop.game.is_over?.should == true
end

# human vs human game

Given /^that there are two human players$/ do
  @human_game_loop = GameLoop.new(output, StringIO.new("human\nhuman\nno"))
  @human_game_loop.game = Game.new(output, [1, 2, 3, 4, 5, 6, 7, 8, 9], @input, Player.new(Human.new(output, StringIO.new("1\n2\n3\nno"))), Player.new(Human.new(output, StringIO.new("4\n5\n6\nno"))))
  @human_game_loop.start_game
end

Then /^we should be able to play until the end\.$/ do
  @human_game_loop.game.is_over?.should == true
end