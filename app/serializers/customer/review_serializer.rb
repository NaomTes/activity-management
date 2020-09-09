class Customer::ReviewSerializer
  include FastJsonapi::ObjectSerializer

  attributes :booked_service_id,
             :comments,
             :ratings

  attribute :service_name do |review|
    review.booked_service.provided_service.service_name
  end
end
