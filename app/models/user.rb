class EmailFormatValidator < ActiveModel::EachValidator
 def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
    after_initialize :set_defaults
    after_validation :set_valid
    
    has_many :leave_requests
    has_many :team_members
    has_many :teams, through: :team_members
    
    validates :email, presence: true, uniqueness: true, email_format: true
    validates :password, presence: true, length: { minimum: 6,
               message: " must be minimum %{count} charecters"}, on: :create
    has_secure_password

    private
    def set_defaults
      self.name = "first name" if name.blank?
    end

    def set_valid
      self.isValid = errors.empty?
    end
end