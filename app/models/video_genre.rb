class VideoGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :video_game
end
