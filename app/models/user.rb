class User < ApplicationRecord
  validates :name, :city, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  has_secure_password
end
