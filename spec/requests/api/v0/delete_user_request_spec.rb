require 'rails_helper'

RSpec.describe 'Delete User Endpoint' do
  describe 'DELETE /api/v0/users/:id' do
    it 'deletes a user' do
      user = create(:user)

      expect { delete "/api/v0/users/#{user.id}" }.to change(User, :count).by(-1)
      expect { User.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
