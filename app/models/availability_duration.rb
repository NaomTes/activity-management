class AvailabilityDuration < ApplicationRecord
  belongs_to :provider
  has_many :availabilities
end
