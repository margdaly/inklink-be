require 'rails_helper'

RSpec.describe 'DiscoverTattooStyle' do
  describe 'GET /api/v0/discover' do
    it 'returns 5 images based on tattoo style' do
      VCR.use_cassette('discover_tattoo_style') do
        headers = { 'CONTENT_TYPE' => 'application/json' }

        discover = { discover: 'american traditional' }
        get '/api/v0/discover', headers: headers, params: discover

        amer_tradition = JSON.parse(response.body, symbolize_names: true)

        expect(amer_tradition[:data]).to be_an(Array)
        expect(amer_tradition[:data].count).to eq(15)

        amer_tradition[:data].map do |data|
          expect(data).to have_key(:id)

          expect(data).to have_key(:type)
          expect(data[:type]).to eq('image')

          expect(data).to have_key(:attributes)
          expect(data[:attributes]).to be_a(Hash)
          expect(data[:attributes]).to have_key(:thumbnail)
          expect(data[:attributes]).to have_key(:title)
        end
      end
    end
  end
end
