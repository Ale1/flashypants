class CreateGuess < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id
      t.binary :status
      t.integer :round_id
    end
  end
end
