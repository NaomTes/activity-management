class Availability < ApplicationRecord
  belongs_to :availability_duration
  has_many :requested_services
  belongs_to :booked_service, optional: true
  belongs_to :provider

  validates_uniqueness_of :provider_id, scope: [:available_on, :from_time, :to_time]

  scope :availabilities_by_month, ->(month) {
      where("extract(year from available_on) = ? AND extract(month from available_on) = ?",
            month.to_date.strftime("%Y"), month.to_date.strftime("%m"))
    }
end
