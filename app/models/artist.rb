class Artist < ApplicationRecord
  validates_presence_of :name, :email, :password_digest, :styles, :pricing
  validates :email, email: true
  scope :artists_with_style, -> (style) { where("'#{style}' = ANY (styles)") }
  has_secure_password
end
