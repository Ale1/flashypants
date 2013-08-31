class Guess < ActiveRecord::Base
  belongs_to :card,:round

  def solve
    #NOTE: also unsolves solves
    self.solved == 1 ? 0 : 1 


end
