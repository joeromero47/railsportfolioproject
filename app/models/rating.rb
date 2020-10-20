class Rating < ApplicationRecord

  has_many :games
  has_many :users, through: :games

  validates :score, presence: true

  #def action_genre
   # games.where(genre: "Action")
  #end 

  #def rpg_genre
   # games.where(genre: "RPG")
  #end

  #def platformer_genre
   # games.where(genre: "Platformer")
  #end 

end
