helpers do

  def login(player)
    session[:player_id] = player.id
  end

  def logout
    session.delete(:player_id)
  end

  def current_user
    @current_user ||= Player.find(session[:player_id]) if session[:player_id]
  end

  def logged_in?
    !!current_user
  end

end
