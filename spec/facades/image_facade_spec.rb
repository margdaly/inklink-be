require 'rails_helper'

RSpec.describe ImageFacade do
  it 'exists' do
    image_facade = ImageFacade.new('traditional american')

    expect(image_facade).to be_a(ImageFacade)
  end

  describe 'get_images' do
    it 'returns list of 5 images', :vcr do
      Vcr.use_cassette('image_facade') do
        image_facade = ImageFacade.new('traditional american')

        expect(image_facade.get_images.count).to eq(5)
        expect(image_facade.get_images).to be_an(Array)
        expect(image_facade.get_images).to all(be_an(Image))
      end
    end
  end
end
