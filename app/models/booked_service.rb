class BookedService < ApplicationRecord
  belongs_to :booking
  belongs_to :provided_service
  has_one :review
end
