class Artist < ApplicationRecord
  validates_presence_of :name, :email, :password_digest, :styles, :pricing

  has_secure_password
end
