get '/sessions/login' do
  erb :'/sessions/login'
end

get '/sessions/logout' do
  logout
  redirect '/'
end

post '/sessions' do
  @user = Player.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    login(@user)
    redirect '/'
  else
    @errors = ["Invalid Username and/or Password"]
    erb :'sessions/login'
  end
end
