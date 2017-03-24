get '/users/:id/characters' do
  @user = User.find(params[:id])
  @characters = @user.characters
  erb :'characters/index'
end

get '/users/:id/characters/new' do
  @user = User.find(params[:id])
  @characters = @user.characters
  if request.xhr?
    erb :'characters/_new', layout:false, locals: {user: @user}
  else
    erb :'characters/new'
  end
end

post '/users/:id/characters' do
  @user = User.find(params[:id])
  @character = Character.new(params[:character])
  @character.player_id = @user.id
  if @character.save
    if request.xhr?
      erb :'characters/_show', layout: false, locals: {character: @character}
    else
      redirect "/users/#{@user.id}/edit"
    end
  else
    @errors = @character.errors.full_messages
    erb :'characters/new'
  end
end
