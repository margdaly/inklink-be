require 'rails_helper'

RSpec.describe ShopsFacade do
  describe 'exists' do
    it 'really does exists' do
      shops_facade = ShopsFacade.new

      expect(shops_facade).to be_a(ShopsFacade)
    end
  end

  describe 'nearby_shops' do
    it 'returns an array of shops' do
      VCR.use_cassette('shops_facade', :record => :new_episodes) do
        shops_facade = ShopsFacade.new
  
        expect(shops_facade.nearby_shops("colorado springs")).to be_a(Array)
        expect(shops_facade.nearby_shops("colorado springs")).to all(be_a(Shop))
      end
    end
  end
end