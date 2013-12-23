class AddSlugToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :slug, :string
    add_index :decks, :slug, unique: true
  end
end
