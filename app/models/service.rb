class Service < ApplicationRecord
  has_many :provided_services
  has_many :providers, through: :provided_services
  has_many :provided_services
  has_many :providers, through: :provided_services

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  validates_uniqueness_of :name
end
