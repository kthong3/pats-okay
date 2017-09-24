get '/rounds/:id' do
  @round = Round.find(params[:id])
  erb :'rounds/show'
end
