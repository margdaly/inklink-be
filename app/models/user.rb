class User < ApplicationRecord
  validates :name, :city, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest

  has_secure_password
end
