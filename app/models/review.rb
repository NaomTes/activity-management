class Review < ApplicationRecord
  belongs_to :booked_service

  validates :comments, :ratings, presence: true

  validates :ratings,
            numericality: { only_integer: true },
            length: { maximum: 1 }
end
