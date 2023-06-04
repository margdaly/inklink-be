require 'rails_helper'

RSpec.describe ImagesService do
  describe '#get_images' do
    it 'returns images', :vcr do
      VCR.use_cassette('images_service') do
        images_service = ImagesService.new

        expect(images_service.get_images('traditional american')).to be_a(Hash)
      end
    end
  end
end
