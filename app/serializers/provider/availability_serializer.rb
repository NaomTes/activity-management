class Provider::AvailabilitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :availability_duration_id,
             :available_on,
             :booked_service_id
  attribute :from_time do |availability|
    availability.from_time.strftime("%I:%M%p")
  end
  attribute :to_time do |availability|
    availability.to_time.strftime("%I:%M%p")
  end
end
