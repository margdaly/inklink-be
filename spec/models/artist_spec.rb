require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    it  { should validate_presence_of(:name) }
    it  { should validate_presence_of(:email) }
    it  { should validate_uniqueness_of(:email) }
    it  { should validate_presence_of(:password_digest) }
    it  { should validate_presence_of(:styles) }
    it  { should validate_presence_of(:pricing) }
  end

  describe 'artists_with_style' do
    it 'returns a list of artists that have a specific style' do
      artist_1 = create(:artist, styles: ["American Traditional", "Watercolor"])
      artist_2 = create(:artist, styles: ["American Traditional", "Black and Grey"])
      artist_3 = create(:artist, styles: ["Watercolor", "Dragon Tats"])

      expect(Artist.artists_with_style("American Traditional")).to eq([artist_1, artist_2])
      expect(Artist.artists_with_style("Watercolor")).to eq([artist_1, artist_3])
    end
  end
end
