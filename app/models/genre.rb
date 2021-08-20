class Genre < ApplicationRecord
  has_many :video_genres
  has_many :video_games, through: :video_genres
  
  validates :name, inclusion: { in: %w(drama family comedy romance action sci-fi horror thriller mystery crime animation adventure fantasy comedy-romance action-comedy superhero), message: "%{value} is not a valid genre"}
end
