class Customer < ApplicationRecord
  include AuthHelper
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :booking_requests
  has_many :bookings

  validates :first_name,
            :last_name,
            :age,
            :street,
            :city,
            :postal_code,
            :phone_number,
            :country, presence: true

  validates :first_name, :last_name, length: { minimum: 3, maximum: 50 }

  validates :age,
            numericality: { only_integer: true },
            length: { minimum: 1, maximum: 3 }

  VALID_PHONE_REGEX = /\A^\d{4}-\d{7}$\z/i
  validates :phone_number, uniqueness: true,
                           format: { with: VALID_PHONE_REGEX }
end
