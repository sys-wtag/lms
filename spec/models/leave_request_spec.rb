require 'rails_helper'

RSpec.describe LeaveRequest, type: :model do
  describe 'upon requesting for a leave with a user logged in' do
    it 'should create leave requests successfully' do 
      user = User.new(email: 'test@gmail.com', password: 'testtest')
      leave_type = LeaveType.new(name: 'test type', description: 'test leave type description')
      expect(LeaveRequest.new( user: user, leave_type: leave_type, start_date: '1-2-23', end_date: '1-2-23')).to be_valid
    end
  end

  describe 'associations' do
    it{ should belong_to(:user)}
    it{ should belong_to(:leave_type)}
  end
end
