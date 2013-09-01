class CreateGuess < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id
      t.binary :status, default:0
      t.integer :round_id
    end
  end
end
