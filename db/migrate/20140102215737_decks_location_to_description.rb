class DecksLocationToDescription < ActiveRecord::Migration
  def change
    change_column :decks, :location, :text
    rename_column :decks, :location, :description
  end
end
