class Provider::ReviewSerializer
  include FastJsonapi::ObjectSerializer

  attributes :booked_service_id,
             :comments,
             :ratings

  attribute :service_name do |review|
    review.booked_service.provided_service.service_name
  end

  attribute :customer do |review|
    "#{review.booked_service.booking.customer.first_name} #{review.booked_service.booking.customer.last_name}"
  end
end
