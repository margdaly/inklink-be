require 'rails_helper'

RSpec.describe 'Delete Artist Endpoint' do
  describe 'DELETE /api/v0/artists/:id' do
    it 'deletes an artist' do
      artist = create(:artist)

      expect{ delete "/api/v0/artists/#{artist.id}" }.to change(Artist, :count).by(-1)

      expect{Artist.find(artist.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end