class Guess < ActiveRecord::Base
  belongs_to :card,:round

  def solved?
    self.solved
  end

  def solve
    #NOTE: only solves, does no unsolve.
    self.solved = 1

  def unsolve
  self.solved = 0 
  end



end
