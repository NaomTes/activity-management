class BookingRequest < ApplicationRecord
  belongs_to :customer
  has_many :requested_services
end
