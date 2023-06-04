require 'rails_helper'

RSpec.describe Shop do
  describe 'shop' do
    it 'exists and has attributes' do
      data = {:location=>
                          {:address=>"716 N Weber St",
                          :address_extended=>"Ste 200",
                          :census_block=>"080410016001002",
                          :country=>"US",
                          :cross_street=>"Monument Street",
                          :dma=>"Colorado Springs-Pueblo",
                          :formatted_address=>"716 N Weber St (Monument Street), Colorado Springs, CO 80903",
                          :locality=>"Colorado Springs",
                          :postcode=>"80903",
                          :region=>"CO"},
               :name=>"Pens & Needles Custom Tattoo Company"}
      shop = Shop.new(data)

      expect(shop).to be_a(Shop)
      expect(shop.name).to eq(data[:name])
      expect(shop.address).to eq(data[:location][:formatted_address])
    end
  end
end