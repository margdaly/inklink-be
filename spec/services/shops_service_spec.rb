require 'rails_helper'

RSpec.describe ShopsService do
  describe 'nearby_shops' do
    it 'exists and returns a hash', :vcr do
      shops = ShopsService.new.nearby_shops("colorado springs")

      expect(shops).to be_a(Hash)
    end
  end
end