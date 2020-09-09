class Provider::BookingSerializer
  include FastJsonapi::ObjectSerializer

  attribute :status
  attribute :booked_services do |booking|
    Provider::BookedServiceSerializer.new(booking.booked_services)
  end
end
