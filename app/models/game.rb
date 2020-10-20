class Game < ApplicationRecord
  belongs_to :user
  belongs_to :rating, optional: true
  has_many :users, through: :ratings
  #accepts_nested_attributes_for :ratings

  validates :title, :genre, presence: true

  #validates :rating_id presence: true

  def rating_attributes=(attributes)
   rating = Rating.find_or_create_by(attributes)
    self.rating = rating if rating.valid? || !self.rating
 end

 scope :order_by_genre, -> {order(:genre)}
 scope :rpgs, -> {where(genre: "RPG")}
 scope :platformers, -> {where(genre: "Platformer")}
 scope :action, -> {where(genre: "Action")}
 
 scope :search_by_genre, -> (search_genre){where("genre = ?", search_genre)}

end
