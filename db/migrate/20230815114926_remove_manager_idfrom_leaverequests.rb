class RemoveManagerIdfromLeaverequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :leave_requests, :manager_id
  end
end
