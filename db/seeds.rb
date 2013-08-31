#test deck:

require 'Faker'

TITLE = %w{ Capital Animals Currency }
ANIMALS = [['cow','moo'],['antelop','snort'],['moose','bellow'],['mice','squeak']]
CAPITAL = [['Alabama','Montgomery'],['Pennsylvania','Harrisburg'],['Ohio','Columbus'],['South Dakota','Pierre']]
CURRENCY= [['Argentina','Peso'],['Denmark', 'Krone'],['India','Rupees'],['Switzerland','Franc']]



class DeckImporter
  def self.import
    TITLE.each do |titles|
      Deck.create(title: titles) 
    end  
  end
end

DeckImporter.import

#refactor deck_id

class CardImporter

  def self.animals
    ANIMALS.each do |animal|
      Card.create(prompt: animal[0],
        answer: animal[1],
        deck_id: 1
        )
    end
  end

  def self.capital
    CAPITAL.each do |cap|
      Card.create(prompt: cap[0],
        answer: cap[1],
        deck_id: 2
        )
    end
  end

  def self.currency
    CURRENCY.each do |cur|
      Card.create(prompt: cur[0],
        answer: cur[1],
        deck_id: 3
        )
    end
  end
end

CardImporter.animals
CardImporter.capital
CardImporter.currency


class UserImporter
  def self.import
    User.create(
      username: Faker::Name.name,
      password: rand(10)
      )
  end
end

10.times { UserImporter.import }
