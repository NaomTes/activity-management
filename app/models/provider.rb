class Provider < ApplicationRecord
  include AuthHelper
  devise :database_authenticatable, :registerable, :validatable

  has_many :provided_services
  accepts_nested_attributes_for :provided_services
  has_many :services, through: :provided_services
  has_many :availability_durations
  has_many :availabilities

  has_many :requested_services, through: :provided_services
  has_many :booking_requests, through: :requested_services

  has_many :booked_services, through: :provided_services
  has_many :bookings, through: :booked_services

  has_many :reviews, through: :booked_services

  validates :first_name,
            :last_name,
            :age,
            :profile_description,
            :base_price,
            :street,
            :city,
            :postal_code,
            :country, presence: true

  validates :first_name, :last_name, length: { minimum: 3, maximum: 50 }

  validates :age,
            numericality: { only_integer: true },
            length: { minimum: 1, maximum: 3 }

  validates :profile_description, length: { minimum: 5, maximum: 100 }
  validates :base_price, numericality: true

  def self.authenticate(email, password)
    provider = Provider.find_by(email: email)
    return nil unless provider.present?
    provider.valid_password?(password) ? provider : nil
  end

  def self.filter(service)
    # byebug
    @service = Service.find_by(name: service)
    @providers = Provider.find(
      ProvidedService.where("service_id = ? AND status = true ", @service.id)
        .pluck(:provider_id).uniq
    )
  end
end
