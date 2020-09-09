class CreateBooking
  attr_reader :booking_request

  def initialize(booking_request)
    @booking_request = booking_request
  end

  def call
    create_booking
  end

  def create_booking
    @customer = Customer.find(@booking_request.customer.id)
    @requested_services = @booking_request.requested_services

    @bookable_services = @requested_services.pluck(:provided_service_id)
      .map { |provided_service| { provided_service_id: provided_service } }

    @booking = @customer.bookings.new(booked_services_attributes: @bookable_services)

    if @booking.save
      @availabilities = @requested_services.pluck(:availability_id)
      @booked_services = @booking.booked_services.pluck(:id)

      @availabilities.each_with_index do |item, index|
        Availability.find(item).update(booked_service_id: @booked_services[index])
      end
      return @booking
    end
  end
end
