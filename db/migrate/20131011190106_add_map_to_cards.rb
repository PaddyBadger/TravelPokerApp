class AddMapToCards < ActiveRecord::Migration
  def change
    add_column :cards, :latitude, :float
    add_column :cards, :longitude, :float
    add_column :cards, :gmaps, :boolean
  end
end
