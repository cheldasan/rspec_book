class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output_double
  @output ||= Output.new
end

Given("I am not yet playing") do
end

When("I start a new game") do
  game = Codebreaker::Game.new output_double
  game.start
end

Then("I should see {string}") do |string|
  expect(output_double.messages).to include(string)
end
