class ProvidedService < ApplicationRecord
  belongs_to :service
  belongs_to :provider
  has_many :requested_services
  has_many :booked_services

  validates :service_id, :uniqueness => { :scope => :provider_id }

  validates :service_description,
            :price, presence: true

  validates :price, numericality: true

  delegate :name, to: :service

  validates :service_description, length: { minimum: 5, maximum: 50 }
end
