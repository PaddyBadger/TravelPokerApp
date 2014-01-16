class CreateDones < ActiveRecord::Migration
  def change
    create_table :dones do |t|

      t.belongs_to :doable, polymorphic: true
      t.timestamps
    end
  end
end
