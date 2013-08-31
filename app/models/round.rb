class Round < ActiveRecord::Base
  
  def all_round_cards
    Deck.find(self.deck_id).all_cards
  end

  def round_unsolved_cards
    Guess.where('deck_id = ?', self.deck_id && 'status = ?','0')
  end

  def round_solved_cards
    self.all_round_cards - self.round_unsolved_cards
  end


end
