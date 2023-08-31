require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'Get new' do 
    it 'should return a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST create' do 
    context 'when correct params provided' do
       it 'creates a new user' do
        expect {
          params = {
           user: { name: 'Test User', email: 'test@example.com', password: 'password' }
          }
          post :create, params: params 
        }.to change(User, :count).by(1)
      end
    end
  end

 describe 'private #user_params' do
    it 'whitelists the correct attributes' do
      params = {
        user: {
          name: 'test',
          email: 'test@gmail.com',
          password: 'testtest'
        }
      }
      should permit(:name, :email, :password).
        for(:create, params: params).
        on(:user)
    end
  end
end
