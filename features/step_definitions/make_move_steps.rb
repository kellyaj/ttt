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
  game = GameLoop.new(output)
  game.start
end

When /^a player sees the prompt "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Then /^the player should be able to enter (\d+) through (\d+) to select a space\.$/ do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end
