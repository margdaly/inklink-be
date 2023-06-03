require 'rails_helper'

RSpec.describe ShopsService do
  describe 'nearby_shops' do
    shops = ShopsService.nearby_shops("colorado springs")

    expect(shops).to be_a(Hash)
  end
end