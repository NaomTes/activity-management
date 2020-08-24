class ProvidedService < ApplicationRecord
  belongs_to :service
  belongs_to :provider
end
