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

  ### USER HELPERS ###

  def current_user
    logged_in? ? User.find(session[:user_id]) : nil
  end

  def current_user_id
    logged_in? ? current_user.id : nil
  end

  ### ROUND HELPERS ###

  def start_round(deck_id)
    session[:round_id] = Round.create(deck_id: deck_id).id
  end

  def current_round
    Round.find(session[:round_id])
  end

  def starting_deck
    # Round.find(current_round_id).all_cards.shuffle
    Card.where(deck_id: current_round.deck_id)
  end

  def next_card(cards)
    cards.pop
  end

  def return_card(id)
    Card.find(id)
  end
end

