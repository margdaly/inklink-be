require 'rails_helper'

RSpec.describe 'Get One User' do
  describe 'sends single user by its valid id' do
    scenario 'happy path' do
      user1 = create(:user)

      get "/api/v0/users/#{user1.id}"

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(user[:data]).to be_a(Hash)

      user_data = user[:data]

      expect(user_data).to have_key(:id)
      expect(user_data[:id]).to be_an(String)

      expect(user_data).to have_key(:type)
      expect(user_data[:type]).to eq('user')

      expect(user_data).to have_key(:attributes)
      expect(user_data[:attributes]).to be_a(Hash)

      attributes = user_data[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:city)
      expect(attributes[:city]).to be_a(String)

      expect(attributes).to have_key(:username)
      expect(attributes[:username]).to be_a(String)

      expect(attributes).to have_key(:password_digest)
      expect(attributes[:password_digest]).to be_a(String)
    end

    # scenario 'sad path' do
    #   invalid_id = 123123123123

    #   get "/api/v0/users/#{invalid_id}"

    #   failure = JSON.parse(response.body, symbolize_names: true)

    #   expect(response.status).to eq(404)
    #   expect(response).to_not be_successful

      # expect(failure).to have_key(:errors)

      # errors = failure[:errors]

      # expect(errors).to be_an(Array)
      # expect(errors[0]).to have_key(:detail)
    # end
  end
end