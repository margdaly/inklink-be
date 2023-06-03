require 'rails_helper'

RSpec.describe 'Artists API', type: :request do
  describe 'GET /api/v0/artist/:id' do
    it 'returns an artist' do
      artist = create(:artist)

      get "/api/v0/artists/#{artist.id}"

      json = JSON.parse(response.body, symoblize_names: true)

      expect(response).to be_successful

      
    end
  end
end