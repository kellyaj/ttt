class Output

  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end

end

require 'stringio'
def output
  @output ||= Output.new
end


Given /^that I am not yet playing the game$/ do
end

When /^I start the game$/ do
  require 'stringio'
  @new_game = GameLoop.new(output, StringIO.new("computer\ncomputer\nyes"))
end

Then /^I should see a welcome message\.$/ do
  @output.messages.size.should == 2
end