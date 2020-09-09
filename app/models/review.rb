class Review < ApplicationRecord
  belongs_to :booked_service

  validates :booked_service_id, uniqueness: { message: "already reviews!" }

  validates :comments, :ratings, presence: true

  validates :ratings,
            numericality: { only_integer: true },
            length: { maximum: 1 }
end
