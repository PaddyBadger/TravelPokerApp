class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.string :location
      t.string :image
      t.string :url
      t.string :description
      t.belongs_to :season
      t.belongs_to :category
      t.belongs_to :user
      

      t.timestamps
    end
    add_index :cards, :user_id
    add_index :cards, :season_id
    add_index :cards, :category_id
  end
end
