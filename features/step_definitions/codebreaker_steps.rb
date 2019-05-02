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
  game = Codebreaker::Game.new(output_double)
  game.start('1234')
end

Then("I should see {string}") do |message|
  expect(output_double.messages).to include(message)
end

Given("the secret code is {string}") do |secret|
  @game = Codebreaker::Game.new(output_double)
  @game.start(secret)
end

When("I guess {string}") do |guess|
  @game.guess(guess)
end

Then("the mark should be {string}") do |mark|
  expect(output_double.messages).to include(mark)
end
