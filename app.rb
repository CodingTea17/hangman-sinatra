require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/hangman')
require('pry')

get('/') do
  the_game = Game.new()
  @game_word = Game.guesses
  erb(:input)
end

get('') do

  erb(:output)
end

post('/output') do
  this_guess = params.fetch("single")
  if this_guess.match(/[a-z]/i) and !Game.box.include?(this_guess)
    if Game.guess?(this_guess)
      @result = "You were right!"
    else
      @result = "You were wrong, guess again"
    end
  else
    @result = "Not a valid letter or duplicate letter!"
  end
  if Game.is_won?
    erb(:success)
  elsif Game.is_lost?
    @man = Game.hangman
    erb(:loss)
  else
    @box = Game.box
    @man = Game.hangman
    @game_word = Game.guesses
    erb(:output)
  end
end
