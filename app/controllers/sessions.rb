get '/login' do
  erb :'sessions/new'
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/decks'
  else
    @errors = ["Please enter a valid username please please also password please"]
    erb :'sessions/new'
  end
end

delete '/logout' do
  session.delete(:user_id)
  redirect '/decks'
end
