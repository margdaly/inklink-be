require 'rails_helper'

RSpec.describe 'Artists API', type: :request do
  describe 'POST /api/v0/artists' do
    it 'creates an artist when all attributes are present' do
      artist_params = ({ 'name': 'Bob Ross',
                         'email': 'bobrossrules@gmail.com',
                         'password': 'password',
                         'password_confirmation': 'password',
                         'styles': ['American Traditional', 'Watercolor'],
                         'pricing': '$'
                      })

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/artists', headers: headers, params: JSON.generate(artist: artist_params)

      created_artist = Artist.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(created_artist.name).to eq(artist_params[:name])
      expect(created_artist.email).to eq(artist_params[:email])
      expect(created_artist.styles).to eq(artist_params[:styles])
      expect(created_artist.pricing).to eq(artist_params[:pricing])
    end

    it 'sad path: returns an error is a required attribute is missing' do
      artist_params = ({ 'name': 'Bob Ross',
                         'email': 'bobrossrules@gmail.com',
                         'password': 'password',
                         'password_confirmation': 'password',
                         'styles': ['American Traditional', 'Watercolor']
                      })

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/artists', headers: headers, params: JSON.generate(artist: artist_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Validation failed: Pricing can't be blank")
    end

    it 'sad path: returns an error if an email is invalid' do
      artist_params = ({ 'name': 'Bob Ross',
                         'email': 'bobrossrulesgmailcom',
                         'password': 'password',
                         'password_confirmation': 'password',
                         'styles': ['American Traditional', 'Watercolor'],
                         'pricing': '$'
                      })

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/artists', headers: headers, params: JSON.generate(artist: artist_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end