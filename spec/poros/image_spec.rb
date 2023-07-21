require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attributes' do
    data = {:thumbnailUrl=>'https://rapidapi.usearch.com/api/thumbnail/get?value=1701595348427531365',
            :name=>'American Traditional - Pipeburn'}

    image = Image.new(data)

    expect(image).to be_an(Image)
    expect(image.title).to eq('American Traditional - Pipeburn')
    expect(image.thumbnail).to eq('https://rapidapi.usearch.com/api/thumbnail/get?value=1701595348427531365')
  end
end
