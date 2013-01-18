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


Given /^that I am not yet playing the game$/ do
end

When /^I start the game$/ do
  game = GameLoop.new(output)
  game.start
end

Then /^I should see a message saying "(.*?)"$/ do |message|
  output.messages.should include(message)
end
