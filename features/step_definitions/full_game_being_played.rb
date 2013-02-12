class Output

  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

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
  @human_game_loop = GameLoop.new(output, StringIO.new("human\nhuman"))
  @human_game_loop.assign_players()
  @human_game_loop.start_game
end

Then /^we should be able to play until the end\.$/ do
  @human_game_loop.is_over?.should == true
end