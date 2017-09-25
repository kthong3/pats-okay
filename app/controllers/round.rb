get '/rounds/:id' do
  @round = Round.find(params[:id])
  erb :'rounds/show'
end

post '/decks/:deck_id/rounds/new' do
  p current_user
  @round = Round.new(user_id: current_user.id, deck_id: params[:deck_id])
  @round.save
  @next_card = @round.pick_random_card
  redirect "/rounds/#{@round.id}/cards/#{@next_card.id}"
end
