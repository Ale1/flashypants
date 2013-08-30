class Card < ActiveRecord::Base
  belongs_to :deck    # other attributes- :prompt, :answer

  def correct_guess?(guess)
    if self.answer == guess ? true : false
  end

end
