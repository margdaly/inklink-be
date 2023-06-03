require 'rails_helper'

RSpec.describe 'Create User' do
  describe 'create a new user' do
    scenario 'happy path' do
      user_params = ({ 'name': 'Chia Seed',
                       'city': 'Denver',
                       'email': 'cha_cha_chia@email.com',
                       'password_digest': 'password' })

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      new_user = User.last

      expect(new_user.name).to eq(user_params[:name])
      expect(new_user.city).to eq(user_params[:city])
      expect(new_user.email).to eq(user_params[:email])
      expect(new_user.password_digest).to eq(user_params[:password_digest])
    end

    scenario 'sad path: missing required attribute' do
      user_params = ({ 'name': 'Chia Seed',
                       'city': '',
                       'email': 'cha_cha_chia@email.com',
                       'password_digest': 'password' })

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      failure = JSON.parse(response.body, symbolize_names: true)

      expect(failure).to have_key(:error)
      expect(failure[:error]).to eq("Validation failed: City can't be blank")
    end
  end
end
