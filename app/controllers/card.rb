get '/rounds/:round_id/cards/:id' do
  pick_random_card
  erb :'cards/show'
end
