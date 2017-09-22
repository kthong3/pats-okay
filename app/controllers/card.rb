get '/rounds/:round_id/cards/:id' do
  @round = Round.find(params[:round_id])
  @card = @round.deck.cards.find(params[:id])
  erb :'cards/show'
end

post '/rounds/:round_id/cards/:id' do
  @round = Round.find(params[:round_id])
  @card = @round.deck.cards.find(params[:id])

  if params[:user_input] == @card.answer
    @guess = Guess.new(completed: true, card_id: @card.id, round_id: @round.id)

    p @guess
    @guess.save

    @guess.counter += 1
    p @guess.errors.full_messages
    @next_card = Card.pick_random_card(@round.deck_id)

    redirect "/rounds/#{@round.id}/cards/#{@next_card.id}"
  else
    @guess = Guess.new(completed: false, card_id: @card.id, round_id: @round.id)
    @guess.counter += 1
    @guess.save
    @next_card = Card.pick_random_card(@round.deck_id)

    redirect "/rounds/#{@round.id}/cards/#{@next_card.id}"
  end
end
