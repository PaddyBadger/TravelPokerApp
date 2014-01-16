class IndexDonesOnUserId < ActiveRecord::Migration
  def change
    add_column :dones, :user_id, :integer
    add_index :dones, :user_id
  end
end
