class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  def solve
    #NOTE: also unsolves
    self.solved_status == 1 ? 0 : 1
    self.save 
  end


end
