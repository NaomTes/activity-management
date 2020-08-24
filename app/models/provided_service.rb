class ProvidedService < ApplicationRecord
  belongs_to :service
  belongs_to :provider
  has_many :requested_services
  has_many :booked_services
end
