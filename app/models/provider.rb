class Provider < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :provided_services
  has_many :services, through: :provided_services
  has_many :availability_durations
end
