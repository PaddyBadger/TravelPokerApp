class AddLikesCountToCards < ActiveRecord::Migration
  def change
    add_column :cards, :likes_count, :integer
  end
end
