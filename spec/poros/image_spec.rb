require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attributes' do
    data = {:thumbnail=>'https://rapidapi.usearch.com/api/thumbnail/get?value=1701595348427531365',
            :title=>'American Traditional - Pipeburn'}

    image = Image.new(data)

    expect(image).to be_an(Image)
    expect(image.title).to eq('American Traditional - Pipeburn')
    expect(image.thumbnail).to eq('https://rapidapi.usearch.com/api/thumbnail/get?value=1701595348427531365')
  end
end
