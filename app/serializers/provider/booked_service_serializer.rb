class Provider::BookedServiceSerializer
  include FastJsonapi::ObjectSerializer

  attribute :service_name do |booked_service|
    booked_service.provided_service.service_name
  end

  attribute :availabilities do |booked_service|
    Provider::AvailabilitySerializer.new(booked_service.availabilities)
  end
end
