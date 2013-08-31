helpers  do

  def login(user_id)
    session[:user_id] = User.find(id: user_id)
  end

  def logout
    session[:user_id].clear
  end

  def logged_in?
    if session[:user_id] ? true : false
  end

  def current_user
    if logged_in? ? User.find(session[:user_id]) : nil
  end

  def current_user_id
    if logged_in? ? current_user.id : nil
  end

end

