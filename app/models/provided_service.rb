class ProvidedService < ApplicationRecord
  belongs_to :service
  belongs_to :provider
  has_many :requested_services
  has_many :booked_services

  def service_name
    service.name
  end

  validates :service_id, :uniqueness => { :scope => :provider_id }

  validates :service_description,
            :price, presence: true

  validates :price, numericality: true

  validates :service_description, length: { minimum: 5, maximum: 50 }
end
