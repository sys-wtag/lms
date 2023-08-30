class AddValidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :valid, :boolean
  end
end
