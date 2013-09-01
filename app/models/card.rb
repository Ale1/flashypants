class Card < ActiveRecord::Base
  belongs_to :deck    # other attributes- :prompt, :answer
  has_one :guess

  def correct_guess?(guess)
    self.answer == guess ? true : false
  end

end
