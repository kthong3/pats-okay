class User < ApplicationRecord
  has_many :rounds

  validates :username, :email, :encrypted_password, { :presence => true }
  validates :username, :email, { uniqueness: true }
end
