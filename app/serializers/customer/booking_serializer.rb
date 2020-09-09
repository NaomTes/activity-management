class Customer::BookingSerializer
  include FastJsonapi::ObjectSerializer

  attribute :status
  attribute :booked_services do |booking|
    Customer::BookedServiceSerializer.new(booking.booked_services)
  end
end
