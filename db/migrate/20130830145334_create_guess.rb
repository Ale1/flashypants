class CreateGuess < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :card
      t.belongs_to :round      
      t.boolean :solved_status, :default => false
    end
  end
end
