class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :comment
      t.belongs_to :user
      t.integer :vote

      t.timestamps
    end
    add_index :votes, :comment_id
    add_index :votes, :user_id
  end
end
