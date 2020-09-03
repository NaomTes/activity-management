class AvailabilityDuration < ApplicationRecord
  belongs_to :provider
  has_many :availabilities

  validates :starting_date,
            :from_time,
            :to_time,
            :repetition_days,
            :slots_offset,
            :repetition, presence: true

  validates :repetition,
            :slots_offset, numericality: { only_integer: true }

  validate :starting_date_cannot_be_in_the_past

  def starting_date_cannot_be_in_the_past
    if starting_date.present? && starting_date < Date.today
      errors.add(:starting_date, "can't be in the past")
    end
  end
end
