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


 def self.action_genre
  Game.where(genre: "Action") #&& session[:id] == current_user.params[:id]
 end 

 def rpg_genre
   games.where(genre: "RPG")
 end

 def platformer_genre
   games.where(genre: "Platformer")
 end 

 scope :order_by_genre, -> {order(:genre)}
 scope :rpgs, -> {where(genre: "RPG")}
 scope :platformers, -> {where(genre: "Platformer")}
 scope :action, -> {where(genre: "Action")}
 
 scope :search_by_genre, -> (search_genre){where("genre = ?", search_genre)}

end
