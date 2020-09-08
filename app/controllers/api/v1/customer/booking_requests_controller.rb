class Api::V1::Customer::BookingRequestsController < Api::V1::Customer::ApiController
  before_action :authenticate

  def create
    if params[:booking_request][:requested_services_attributes].length == 0
      render json: { errors: ["There must be atleast one requested service"] }, status: :not_found
    else
      @booking_request = current_customer.booking_requests.new(booking_request_params)
      if @booking_request.save
        render json: Customer::BookingRequestSerializer.new(@booking_request).serialized_json,
               status: :created
      else
        unprocessable_entity @booking_request
      end
    end
  end

  private

  def booking_request_params
    params.require(:booking_request).permit(
      requested_services_attributes: [
        :provided_service_id,
        :availability_id,
      ],
    )
  end
end
