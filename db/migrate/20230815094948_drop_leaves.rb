class DropLeaves < ActiveRecord::Migration[7.0]
  def up 
    drop_table :leaves
  end
 def down
  create_table :leaves
 end
end
