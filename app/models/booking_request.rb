class BookingRequest < ApplicationRecord
  enum status: [:pending, :approved, :rejected]
  belongs_to :customer
  has_many :requested_services

  accepts_nested_attributes_for :requested_services
end
