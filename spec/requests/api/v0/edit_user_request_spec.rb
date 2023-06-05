require 'rails_helper'

RSpec.describe 'Edit User' do
  describe 'PATCH /api/v0/users/:id' do
    it 'edits a user' do
      user_id = create(:user).id
      previous_name = User.last.name
      user_params = { name: 'New Name' }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch "/api/v0/users/#{user_id}", headers: headers, params: JSON.generate(user: user_params)
      user = User.find_by(id: user_id)

      expect(response).to be_successful
      expect(user.name).to_not eq(previous_name)
      expect(user.name).to eq('New Name')
    end

    it 'returns an error if a field is nil' do
      user_id = create(:user).id
      user_params = { name: nil }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch "/api/v0/users/#{user_id}", headers: headers, params: JSON.generate(user: user_params)
      user = User.find_by(id: user_id)

      expect(response).to_not be_successful
      expect(user.name).to_not eq(nil)
      expect(response.status).to eq(400)

      failure = JSON.parse(response.body, symbolize_names: true)

      expect(failure).to have_key(:error)
      expect(failure[:error]).to eq("Validation failed: Name can't be blank")
    end

    it 'returns an error if a user can not be found' do
      patch '/api/v0/users/1000000000000'

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      failure = JSON.parse(response.body, symbolize_names: true)

      expect(failure).to have_key(:error)
      expect(failure[:error]).to eq("Couldn't find User with 'id'=1000000000000")
    end
  end
end
