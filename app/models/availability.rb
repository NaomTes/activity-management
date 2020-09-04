class Availability < ApplicationRecord
  belongs_to :availability_duration
  has_many :requested_services
  belongs_to :booked_service, optional: true
  belongs_to :provider

  validates_uniqueness_of :provider_id, scope: [:available_on, :from_time, :to_time]
end
