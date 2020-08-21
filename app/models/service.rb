class Service < ApplicationRecord
  has_many :provided_services
  has_many :providers, through: :provided_services
end
