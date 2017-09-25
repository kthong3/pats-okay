get '/decks' do
  p current_user
  @decks = Deck.all
  erb :'decks/index'
end

