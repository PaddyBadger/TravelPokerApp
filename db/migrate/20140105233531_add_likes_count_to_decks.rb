class AddLikesCountToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :likes_count, :integer
  end
end
