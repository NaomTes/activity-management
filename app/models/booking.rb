class Booking < ApplicationRecord
  enum status: [:incomplete, :complete]
  belongs_to :customer
  has_many :booked_services

  accepts_nested_attributes_for :booked_services
end
