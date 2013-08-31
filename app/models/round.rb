class Round < ActiveRecord::Base
  
  def unsolved_cards  #should go into Round model?
    round_deck = self.deck_id
    Card.where(deck_id == round_deck && ) #unfinished
  end

end
