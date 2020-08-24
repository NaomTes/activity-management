class Availability < ApplicationRecord
  belongs_to :availability_duration
  has_many :requested_services
  belongs_to :booked_service
end
