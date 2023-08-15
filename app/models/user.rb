class User < ApplicationRecord
    has_many :leave_requests
    has_many :team_members
    has_many :teams, through: :team_members
    
    validates :email, presence: true
    validates :password, presence: true

    has_secure_password
end