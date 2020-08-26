class Provider::AvailabilityDurationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :provider_id,
             :starting_date,
             :repetition,
             :repetition_days

  attribute :from_time do |duration|
    duration.from_time.strftime("%I:%M%p")
  end

  attribute :to_time do |duration|
    duration.to_time.strftime("%I:%M%p")
  end

  attribute :availabilities do |duration|
    Provider::AvailabilitySerializer.new(duration.availabilities)
  end
end
