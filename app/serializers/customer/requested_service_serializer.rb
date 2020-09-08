class Customer::RequestedServiceSerializer
  include FastJsonapi::ObjectSerializer

  attribute :service_name do |requested_service|
    requested_service.provided_service.service_name
  end

  attribute :availability do |requested_service|
    Customer::AvailabilitySerializer.new(requested_service.availability)
  end
end
