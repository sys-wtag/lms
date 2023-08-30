class RemoveValidFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :valid, :boolean
  end
end
