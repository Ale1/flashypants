class CreateRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :score, default: 0
<<<<<<< HEAD
      t.integer :attempts, default: 0
=======
>>>>>>> merging Dan't changes
      t.integer :deck_id
    end
  end
end
