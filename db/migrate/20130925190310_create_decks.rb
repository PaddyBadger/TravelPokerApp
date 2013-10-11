class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.string :location
      t.string :image
      t.belongs_to :user

      t.timestamps
    end
    add_index :decks, :user_id
  end
end
