require 'rails_helper'

RSpec.describe 'Edit Artist' do
  describe 'PATCH /api/v0/artists/:id' do
    it 'edits an artist' do
      artist_id = create(:artist).id
      previous_pricing = Artist.last.pricing
      artist_params = { pricing: "$5000" }
      headers = { "CONTENT_TYPE" => "application/json" }

      patch "/api/v0/artists/#{artist_id}", headers: headers, params: JSON.generate(artist: artist_params)
      artist = Artist.find_by(id: artist_id)

      expect(response).to be_successful
      expect(artist.pricing).to_not eq(previous_pricing)
      expect(artist.pricing).to eq("$5000")
    end

    it 'returns an error if a field is nil' do
      artist_id = create(:artist).id
      artist_params = { name: nil }
      headers = { "CONTENT_TYPE" => "application/json" }

      patch "/api/v0/artists/#{artist_id}", headers: headers, params: JSON.generate(artist: artist_params)
      artist = Artist.find_by(id: artist_id)

      expect(response).to_not be_successful
      expect(artist.name).to_not eq(nil)
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Validation failed: Name can't be blank")
    end

    it 'returns an error if an artist can not be found' do
      patch "/api/v0/artists/1000000000000"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Couldn't find Artist with 'id'=1000000000000")
    end
  end
end