class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.string :question
    end
  end
end
