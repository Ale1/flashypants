class Round < ActiveRecord::Base

  # return all cards from the current round.
  def self.starting_deck
    Deck.find(self.deck_id).all_cards.shuffle
  end

  # # return only unsolved cards.
  # def round_unsolved_cards
  #   Guess.where('deck_id = ?', self.deck_id && 'status = ?','0')
  # end

  # # return only solved cards.
  # def round_solved_cards
  #   self.all_round_cards - self.round_unsolved_cards
  # end

  # turn only solved cards.
  def round_solved_cards
    self.all_round_cards - self.round_unsolved_cards

  def next_card
    Deck.find(self.deck_id).top_card
  end

  def cards_left

  end

end
