class Artist < ApplicationRecord
  validates_presence_of :name, :username, :password_digest, :styles, :pricing, :contact_info

  has_secure_password
end
