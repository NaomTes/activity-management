class Provider::BookingRequestSerializer
  include FastJsonapi::ObjectSerializer

  attribute :status
  attribute :requested_service do |booking_request|
    Provider::RequestedServiceSerializer.new(booking_request.requested_services)
  end
end
