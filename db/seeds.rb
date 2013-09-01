#test deck:


require 'Faker'

TITLE = %w{ Capital Animals Currency }
ANIMALS = [['cow','moo'],['antelop','snort'],['moose','bellow'],['mice','squeak']]
CAPITAL = [['Alabama','Montgomery'],['Pennsylvania','Harrisburg'],['Ohio','Columbus'],['South Dakota','Pierre']]

CURRENCY= [['Argentina','Peso'],['Denmark', 'Krone'],['India','Rupee'],['Switzerland','Franc']]

QUESTIONS = ['What is the state capital?','What sound does this animal make?','What is this country\'s main unit of currency?']


#refactor deck_id

class DeckImporter
  def self.import
    3.times do |index|
      Deck.create(title: TITLE[index], question: QUESTIONS[index]) 
    end  
  end
end

class CardImporter
    def self.capital
    CAPITAL.each do |cap|
      Card.create(prompt: cap[0],
        answer: cap[1],
        deck_id: 1
        )
    end
  end

  def self.animals
    ANIMALS.each do |animal|
      Card.create(prompt: animal[0],
        answer: animal[1],
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

class UserImporter
  def self.import
    User.create(
      username: Faker::Name.name,
      password: rand(10)
      )
  end
end

DeckImporter.import
CardImporter.animals
CardImporter.capital
CardImporter.currency
10.times { UserImporter.import }

User.create(username: 'luisa', password: 'luisa')
User.create(username: 'christian', password: 'christian')
User.create(username: 'dan', password: 'dan')
User.create(username: 'alejandro', password: 'alejandro')

