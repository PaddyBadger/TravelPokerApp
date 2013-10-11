class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :description
      t.belongs_to :card
      t.belongs_to :user

      t.timestamps
    end
    add_index :comments, :card_id
    add_index :comments, :user_id
  end
end
