post '/users/:id/locations/new' do
  @user = User.find(params[:id])
  @location = Location.new(params[:location])
  @location.locationable = @user
  if @location.save
    redirect :"/users/#{@user.id}/edit"
  else
    @errors = @location.errors.full_messages
    erb :"users/edit"
  end
end

put 'users/:id/locations/:locations_id' do
  @user = User.find(params[:id])
  @location = Location.find(params[:location_id])
  @location.update_attr(params[:location])
  erb :"users/edit"
end
