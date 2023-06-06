require 'rails_helper'

RSpec.describe 'SearchForShops' do
  describe 'GET /api/v0/search' do
    it 'returns 10 shops based on search', :vcr do
      VCR.use_cassette('search_for_shops') do
        headers = { 'CONTENT_TYPE' => 'application/json' }

        search = { city: 'Colorado Springs' }
        get '/api/v0/search', headers: headers, params: search

        shops = JSON.parse(response.body, symbolize_names: true)

        expect(shops[:data]).to be_an(Array)
        expect(shops[:data].count).to eq(10)

        shops[:data].each do |shop|
          expect(shop).to have_key(:id)

          expect(shop).to have_key(:type)
          expect(shop[:type]).to eq('shop')

          expect(shop).to have_key(:attributes)
          expect(shop[:attributes]).to be_a(Hash)
          expect(shop[:attributes]).to have_key(:name)
          expect(shop[:attributes]).to have_key(:address)
        end
      end
    end
  end
end