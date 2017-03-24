get '/sessions/login' do
  erb :'/sessions/login'
end

get '/sessions/logout' do
  logout
  redirect '/'
end

post '/sessions' do
  @player = Player.find_by(username: params[:username])
  if @player && @player.authenticate(params[:password])
    login(@player)
    redirect '/'
  else
    @errors = ["Invalid Username and/or Password"]
    erb :'sessions/login'
  end
end
