require 'rails_helper'

RSpec.describe 'Artists API', type: :request do
  describe 'POST /api/v0/artists' do
    it 'creates an artist when all attributes are present' do
      artist_params = ({ "name": "Bob Ross",
                        "username": "bobrossrules@gmail.com",
                        "password_digest": "password",
                        "styles": ["American Traditional", "Watercolor"],
                        "pricing": "$",
                        "contact_info": "666-867-5309"
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v0/artists', headers: headers, params: JSON.generate(artist: artist_params)

      created_artist = Artist.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(created_artist.name).to eq(artist_params[:name])
      expect(created_artist.username).to eq(artist_params[:username])
      expect(created_artist.password_digest).to eq(artist_params[:password_digest])
      expect(created_artist.styles).to eq(artist_params[:styles])
      expect(created_artist.pricing).to eq(artist_params[:pricing])
      expect(created_artist.contact_info).to eq(artist_params[:contact_info])
    end

    it 'sad path: returns an error is a required attribute is missing' do
      artist_params = ({ "name": "Bob Ross",
        "username": "bobrossrules@gmail.com",
        "password_digest": "password",
        "styles": ["American Traditional", "Watercolor"]
        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v0/artists', headers: headers, params: JSON.generate(artist: artist_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:errors)
      require 'pry'; binding.pry
    end
  end
end