class User < ApplicationRecord
  has_secure_password  # Provides password hashing and authentication methods
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
