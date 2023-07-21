require 'rails_helper'

RSpec.describe ImageFacade do
  it 'exists' do
    image_facade = ImageFacade.new

    expect(image_facade).to be_a(ImageFacade)
  end

  describe 'get_images' do
    it 'returns list of 15 images' do
      VCR.use_cassette('image_facade') do
        image_facade = ImageFacade.new

        expect(image_facade.get_images('traditional american').count).to eq(15)
        expect(image_facade.get_images('traditional american')).to be_an(Array)
        expect(image_facade.get_images('traditional american')).to all(be_an(Image))
      end
    end
  end
end
