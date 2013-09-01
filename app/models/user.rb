class User < ActiveRecord::Base
  has_many :rounds

  def start_round
    # starts a new round with a given deck
  end



  def global_stats
    # returns stats for all of a user's rounds
  end

  def last_game_stats
    # returns stats for the user's most recent round
  end

end
