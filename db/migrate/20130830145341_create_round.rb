class CreateRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :score, default: 0
      t.integer :attempts, default: 0
      t.integer :deck_id
    end
  end
end
