class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds 

  def all_cards
    #retrieves all cards in this deck
    Card.where('deck_id = ?', self.id)
  end

  def count_cards
    #counts all cards in this deck
    self.get_cards.count
  end

end

