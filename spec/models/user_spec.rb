require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do 
    it {should have_many(:leave_requests)}
    it {should have_many(:team_members)}
    it {should have_many(:teams)}
  end

  describe 'validations' do 
    it { should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it { should validate_uniqueness_of(:email)}
    it {should have_secure_password}
  end

  context 'upon creation' do
    let(:message)do
    puts 'let is running'
    'message'
    end

    before(:example, :specific) do 
    @user = User.new(email: 'test@gmail.com', password: 'testtest')
    end
    
    after(:example, :specific) do 
      @user = be_nill
    end

    it 'cannot have leave requests' , :specific do
      expect {@user.leave_requests.create!}.to raise_error(ActiveRecord::RecordNotSaved)
      puts message
    end

    it 'creates user successfully when provided valid attributes' , :specific do
      expect(@user).to be_valid
    end

    it 'is not valid with missing attributes' do
    expect(User.new(password: 'aaaaaa')).to_not be_valid
    end

    it 'is not valid with a duplicate email' do 
    existing_user = User.create(email: 'test@example.com')
    user = User.new(email: 'test@example.com')
    expect(user).to_not be_valid
    end

    it 'is not valid if a password is not provided' do 
    expect(User.new(email: 'tester@gmail.com')).to_not be_valid
    end

    it 'is not valid if password is less than 6 characters' do 
    expect(User.new(password: 'hello')).to_not be_valid
    end

    it 'default value should be set if value not provided' , :specific do
    usersName = @user.name
    expect(usersName).not_to be_nil
    end
  end
end
