class Artist < ApplicationRecord
  validates_presence_of :name, :email, :password_digest, :styles, :pricing

  has_secure_password

  def self.artists_with_style(style)
    where("'#{style}' = ANY (styles)")
  end
end
