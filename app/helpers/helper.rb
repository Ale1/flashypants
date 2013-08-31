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
    Card.where(deck_id: current_round.deck_id).shuffle
  end

  def next_card(cards)
    cards.pop
  end

  def return_card(id)
    Card.find(id)
  end

  def total_cards
    current_round.deck.cards.count
  end

  def current_score
    current_round.score
  end

  def convert_params_to_card_objects(array)
    array.map! do |id|
      Card.find(id)
    end
  end

  def correct_answer
    round = current_round
    round.score += 1
    round.save!
    "That's correct!"
  end

  def incorrect_answer
    "Sorry, that's incorrect."
  end
end

