class AddImageToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :image, :string
  end
end
