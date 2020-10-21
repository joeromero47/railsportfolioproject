class Rating < ApplicationRecord

  has_many :games
  has_many :users, through: :games

  validates :score, presence: true


end
