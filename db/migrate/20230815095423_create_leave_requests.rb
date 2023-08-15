class CreateLeaveRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :leave_type, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :status
      t.text :reason
      t.references :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
