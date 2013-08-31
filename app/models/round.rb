class Round < ActiveRecord::Base
  def unsolved_cards
    round_deck = self.deck_id
    Card.where(deck_id == round_deck && ) #unfinished

end
