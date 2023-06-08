require 'rails_helper'

RSpec.describe 'Edit Artist' do
  describe 'PATCH /api/v0/artist' do
    it 'edits an artist' do
      artist_email = create(:artist).email
      previous_pricing = Artist.last.pricing
      artist_params = { pricing: "$5000" }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch '/api/v0/artist', headers: headers, params: JSON.generate(artist: artist_params)
      artist = Artist.find_by(email: artist_email)

      expect(response).to be_successful
      expect(artist.pricing).to_not eq(previous_pricing)
      expect(artist.pricing).to eq('$5000')
    end

    it 'returns an error if a field is nil' do
      artist_email = create(:artist).email
      artist_params = { name: nil }
      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch '/api/v0/artist', headers: headers, params: JSON.generate(artist: artist_params)
      artist = Artist.find_by(email: artist_email)

      expect(response).to_not be_successful
      expect(artist.name).to_not eq(nil)
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Validation failed: Name can't be blank")
    end

    it 'returns an error if an artist can not be found' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      email_params = { email: 'bad_artist@emailcom' }

      patch '/api/v0/artist', headers: headers, params: email_params

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Couldn't find Artist")
    end
  end
end