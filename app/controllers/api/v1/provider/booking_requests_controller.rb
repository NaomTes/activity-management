class Api::V1::Provider::BookingRequestsController < Api::V1::Provider::ApiController
  before_action :authenticate
  before_action :set_booking_request, only: [:update, :show]

  def index
    @booking_requests = current_provider.booking_requests
    render json: Provider::BookingRequestSerializer.new(@booking_requests).serializable_hash,
           status: :ok
  end

  def update
    if @booking_request.update(booking_request_params)
      if @booking_request.rejected?
        render json: Provider::BookingRequestSerializer.new(@booking_request).serializable_hash,
               status: :ok
      else
        @booking = CreateBooking.new(@booking_request).call
        render json: Provider::BookingSerializer.new(@booking), status: :created
      end
    else
      unprocessable_entity @booking_request.errors
    end
  end

  def show
    render json: Provider::BookingRequestSerializer.new(@booking_request).serializable_hash,
           status: :ok
  end

  private

  def set_booking_request
    @booking_request = current_provider.booking_requests.find(params[:id])
  end

  def booking_request_params
    params.require(:booking_request).permit(
      :status
    )
  end
end
