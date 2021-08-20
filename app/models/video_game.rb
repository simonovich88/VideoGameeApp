class VideoGame < ApplicationRecord
  belongs_to :user
  has_many :wishlists
  has_many :rental_requests
  has_many :video_genres
  has_many :genres, through: :video_genres

  validates :title, presence: true
  validates :year, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :cover_photo, url: { allow_blank: true }

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true } 
    }
end
