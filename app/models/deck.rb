class Deck < ActiveRecord::Base
  has_many :cards


  def all_cards
    #retrieves all cards in this deck
    Card.where('deck_id = ?', self.id)
  end

  def count_cards
    #counts all cards in this deck
    self.get_cards.count
  end

  def array_decks
    #retrieves all decks titles and inserts into array for viewing
    Deck.all #unfinished
  end


end

