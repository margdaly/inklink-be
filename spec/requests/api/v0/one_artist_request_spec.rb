require 'rails_helper'

RSpec.describe 'Artists API', type: :request do
  describe 'GET /api/v0/artist/:id' do
    it 'returns an artist' do
      artist = create(:artist, name: "Bob Ross",
                               email: "bobrossrules@gmail.com",
                               password: "password",
                               password_confirmation: "password",
                               styles: ["American Traditional", "Watercolor"],
                               pricing: "$",
                               contact_info: "666-867-5309")

      get "/api/v0/artists/#{artist.id}"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to eq(artist.id.to_s)
      expect(json[:data][:attributes]).to have_key(:name)
      expect(json[:data][:attributes][:name]).to eq(artist.name)
      expect(json[:data][:attributes]).to have_key(:email)
      expect(json[:data][:attributes][:email]).to eq(artist.email)
      expect(json[:data][:attributes]).to have_key(:password_digest)
      expect(json[:data][:attributes][:password_digest]).to eq(artist.password_digest)
      expect(json[:data][:attributes]).to have_key(:styles)
      expect(json[:data][:attributes][:styles]).to eq(artist.styles)
      expect(json[:data][:attributes]).to have_key(:pricing)
      expect(json[:data][:attributes][:pricing]).to eq(artist.pricing)
      expect(json[:data][:attributes]).to have_key(:contact_info)
      expect(json[:data][:attributes][:contact_info]).to eq(artist.contact_info)
    end

    it 'sad path: returns a 404 status if artist is not found' do
      get '/api/v0/artists/100000'

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      failure = JSON.parse(response.body, symbolize_names: true)

      expect(failure).to be_a(Hash)
      expect(failure).to have_key(:error)

      expect(failure[:error]).to eq("Couldn't find Artist with 'id'=100000")
    end
  end
end