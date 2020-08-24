class RequestedService < ApplicationRecord
  belongs_to :provided_service
  belongs_to :booking_request
end
