class Guess < ActiveRecord::Base
  belongs_to :card,:round
end
