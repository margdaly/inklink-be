require 'rails_helper'

RSpec.describe 'SearchTattooStyle' do
  describe 'GET /api/v0/search' do
    it 'returns 5 images based on tattoo style', :vcr do
      VCR.use_cassette('search_tattoo_style') do
        get '/api/v0/search'
      end
    end
  end
end