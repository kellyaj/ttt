class Output

  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

end


Given /^that there are two computer players$/ do
  @new_game_loop = GameLoop.new(output, StringIO.new("cpu\ncpu\nno"))
  @new_game_loop.start_game
end

Then /^they should be able to play until the end\.$/ do
  @new_game_loop.game.is_over?.should == true
end