class Artist < ApplicationRecord
  validates_presence_of :name, :email, :password_digest, :styles, :pricing, :contact_info

  validates_presence_of :password, confirmation: {case_sensitive: true}
  has_secure_password
end
