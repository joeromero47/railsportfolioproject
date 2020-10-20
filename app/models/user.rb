class User < ApplicationRecord
  has_many :games
  has_many :ratings, through: :games
  has_secure_password
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true

end
