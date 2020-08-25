class Provider < ApplicationRecord
  include AuthHelper
  devise :database_authenticatable, :registerable, :validatable

  has_many :provided_services
  has_many :services, through: :provided_services
  has_many :availability_durations
  validates :first_name,
            presence: true,
            length: { minimum: 5, maximum: 50 }
  validates :last_name,
            presence: true,
            length: { minimum: 5, maximum: 50 }
  validates :age,
            presence: true,
            numericality: { only_integer: true },
            length: { minimum: 1, maximum: 3 }
  validates :profile_description,
            presence: true,
            length: { minimum: 5, maximum: 100 }
  validates :base_price,
            presence: true,
            numericality: true
  # pattern validations are required
  validates :street,
            presence: true
  validates :city,
            presence: true
  validates :postal_code,
            presence: true,
            numericality: true
  validates :country,
            presence: true
  # end
end
