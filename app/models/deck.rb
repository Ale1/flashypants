class Deck < ActiveRecord::Base
  has_many :card

  def all_cards
    #checks how many cards in this deck
    Card.where('deck_id = ?', self.id)
  end

  def count_cards
    self.get_cards.count
  end
end
