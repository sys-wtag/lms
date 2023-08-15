class LeaveRequest < ApplicationRecord
  belongs_to :user
  belongs_to :leave_type
  belongs_to :manager, class_name: 'User', foreign_key: 'tl_id', optional: true
end
