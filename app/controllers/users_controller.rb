get '/users/new' do
  if request.xhr?
    erb :'users/_new', layout:false
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users' do
  @user = User.create(params[:user])
  if @user.errors.full_messages.empty?
    login(@user)
    redirect "/users/#{@user.id}/edit"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.username = params[:user][:username]
  @user.proximity = params[:user][:proximity].to_i
  if @user.save
    redirect "/users/#{@user.id}/edit"
  else
    @errors = @user.errors.full_messages
    erb :'users/edit'
  end
end
