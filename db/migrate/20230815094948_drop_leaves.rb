class DropLeaves < ActiveRecord::Migration[7.0]
  def change
    drop_table :leaves
  end
end
