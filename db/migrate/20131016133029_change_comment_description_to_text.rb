class ChangeCommentDescriptionToText < ActiveRecord::Migration
  def change
    change_column :comments, :description, :text 
  end
end
