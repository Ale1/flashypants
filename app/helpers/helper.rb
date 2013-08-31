helpers  do

  def login
    session[:user_id] = self.id
  end

  def logout
    session[:user_id].clear
  end

  def start_round(deck) # Luisa, use this when player picks a deck!
    session[:round_id] = Round.create(deck)
  end

  
end
