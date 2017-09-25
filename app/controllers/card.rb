get '/rounds/:round_id/cards/:id' do
  @round = Round.find(params[:round_id])
  @card = @round.deck.cards.find(params[:id])
  erb :'cards/show'
end

post '/rounds/:round_id/cards/:id' do
  @round = Round.find(params[:round_id])
  @card = @round.deck.cards.find(params[:id])
  @guess = @card.guesses.find_by(round_id: @round.id)
  @guess.increment(:counter)
  @guess.save

  if @guess.check_answer(params[:user_answer])
    @guess.update(completed: true)
    @guess.save
  end

  shit = @round.guesses.where(completed: true).count
  if @round.guesses.count == shit
    redirect "/rounds/#{@round.id}"
  end

  @next_card = @round.pick_random_card
  redirect "/rounds/#{@round.id}/cards/#{@next_card.id}"
end
