class CreateCard < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :prompt
      t.string :answer
      t.integer :deck_id
    end
  end
end
