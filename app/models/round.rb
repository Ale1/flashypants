class Round < ActiveRecord::Base

  # return all cards from the current round.

  # # return only unsolved cards.
  # def round_unsolved_cards
  #   Guess.where('deck_id = ?', self.deck_id && 'status = ?','0')
  # end

  # # return only solved cards.
  # def round_solved_cards
  #   self.all_round_cards - self.round_unsolved_cards
  # end

  def cards_left

  end
end
