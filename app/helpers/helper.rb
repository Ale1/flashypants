helpers do

  def login(user_id)
    session[:user_id] = User.find(id: user_id)
  end

  def logout
    session.clear
  end

  def logged_in?
    session[:user_id] ? true : false
  end

  def current_user
    logged_in? ? User.find(session[:user_id]) : nil
  end

  def current_user_id
    logged_in? ? current_user.id : nil
  end

  def start_round(deck) # Luisa, use this when player picks a deck!
    session[:round_id] = Round.create(deck_id: deck.id)
  end

  def current_round
    Round.find(session[:round_id])
  end
end

