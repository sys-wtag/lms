class AddIsValidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :isValid, :boolean
  end
end
