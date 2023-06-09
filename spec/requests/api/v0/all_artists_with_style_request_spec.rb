require 'rails_helper'

RSpec.describe "Api::V0::Artists", type: :request do
  describe "GET /api/v0/artists" do
    it 'returns all artists' do

      5.times do
        create(:artist, styles: ["american traditional", "watercolor"])
      end

      headers = { 'CONTENT_TYPE' => 'application/json' }

      style = { style: 'american traditional' }

      get '/api/v0/artists', headers: headers, params: style

      expect(response).to be_successful

      artists = JSON.parse(response.body, symbolize_names: true)

      artists[:data].each do |artist|
        expect(artist).to have_key(:id)
        expect(artist[:id]).to be_an(String)
        expect(artist).to have_key(:type)
        expect(artist[:type]).to eq('artist')
        expect(artist).to have_key(:attributes)
        expect(artist[:attributes]).to be_a(Hash)

        expect(artist[:attributes]).to have_key(:name)
        expect(artist[:attributes][:name]).to be_a(String)

        expect(artist[:attributes]).to have_key(:email)
        expect(artist[:attributes][:email]).to be_a(String)

        expect(artist[:attributes]).to have_key(:password_digest)
        expect(artist[:attributes][:password_digest]).to be_a(String)

        expect(artist[:attributes]).to have_key(:styles)
        expect(artist[:attributes][:styles]).to be_an(Array)

        expect(artist[:attributes]).to have_key(:pricing)
        expect(artist[:attributes][:pricing]).to be_a(String)
      end
    end

    it 'sad path: it returns no artist if no artist matches the search' do
      5.times do
        create(:artist, styles: ["american traditional", "watercolor"])
      end

      headers = { 'CONTENT_TYPE' => 'application/json' }

      style = { style: 'geometric' }

      get '/api/v0/artists', headers: headers, params: style

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data]).to be_empty
    end
  end
end