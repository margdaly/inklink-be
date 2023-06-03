require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    it  { should validate_presence_of(:name) }
    it  { should validate_presence_of(:username) }
    it  { should validate_presence_of(:password_digest) }
    # it  { should validate_presence_of(:styles) }
    # it  { should validate_presence_of(:pricing) }
    # it  { should validate_presence_of(:contact_info) }
  end
end
