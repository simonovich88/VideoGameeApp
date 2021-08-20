class RentalRequest < ApplicationRecord
  belongs_to :video_game
  belongs_to :user

  validates :status, presence: true, inclusion: { in: ['Accepted', 'Rejected', 'Pending'] } 
  validates :start_date, presence: true
  validates :end_date, presence: true
end
