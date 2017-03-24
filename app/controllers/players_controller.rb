get '/players/new' do
  erb :'users/new'
end

post '/players' do
  @player = Player.new(params[:user])
  if @player.save
    login(@player)
    redirect '/'
  else
    @errors = @player.errors.full_messages
    erb :'players/new'
  end
end
