class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :cards, :description, :text 
  end
end
