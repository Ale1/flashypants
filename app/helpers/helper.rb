helpers  do

  def login
    session[:user_id] = self.id
  end

  def logout
    session[:user_id].clear
  end

end