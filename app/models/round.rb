class Round < ActiveRecord::Base
  
  # return all cards from the current round.
  def all_round_cards 
    Deck.find(self.deck_id).all_cards
  end

  # return only unsolved cards.
  def round_unsolved_cards
    Guess.where('deck_id = ?', self.deck_id && 'status = ?','0')
  end

  # return only solved cards.
  def round_solved_cards
    self.all_round_cards - self.round_unsolved_cards
  end

  def next_card
    Deck.find(self.deck_id).top_card
  end

end
