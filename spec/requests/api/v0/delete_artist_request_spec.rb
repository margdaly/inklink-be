require 'rails_helper'

RSpec.describe 'Delete Artist Endpoint' do
  describe 'DELETE /api/v0/artist' do
    it 'deletes an artist' do
      artist = create(:artist)

      headers = { 'CONTENT_TYPE' => 'application/json' }
      email_params = { email: artist.email }

      expect { delete '/api/v0/artist', headers: headers, params: JSON.generate(email_params) }.to change(Artist, :count).by(-1)

      expect { Artist.find(artist.email) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
