class Game < ApplicationRecord
  belongs_to :user
  belongs_to :rating, optional: true
  has_many :users, through: :ratings
  #accepts_nested_attributes_for :ratings
  scope :created_before, ->(time) { where("created_at < ?", time) }

  validates :title, :genre, presence: true

  def rating_attributes=(attributes)
   rating = Rating.find_or_create_by(attributes)
    self.rating = rating if rating.valid? || !self.rating
 end
 
 def self.most_recent(limit)
  order("created_at desc").limit(limit)
 end
 
 scope :search_by_genre, -> (search_genre){where("genre = ?", search_genre)}

end
