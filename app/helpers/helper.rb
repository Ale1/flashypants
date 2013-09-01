helpers do

  def login(user)
    session[:user_id] = user.id
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
    round = Round.create(user_id: current_user_id, deck_id: deck_id)
    session[:round_id] = round.id
    populate_guesses
  end

  def populate_guesses
    current_round.deck.cards.each do |card|
      Guess.create(round_id: current_round.id, card_id: card.id)
    end
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

  def unsolved_cards
    guesses = current_round.guesses.select {|guess| guess.solved_status == false }
    guesses.map {|guess| Card.find(guess.card_id) }
  end

  def solve(card_id)
    guess = current_round.guesses.where(card_id: card_id).first
    guess.solved_status = true
    guess.save
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

