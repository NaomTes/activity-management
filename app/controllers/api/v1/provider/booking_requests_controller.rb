class Api::V1::Provider::BookingRequestsController < Api::V1::Provider::ApiController
  before_action :authenticate

  def index
    @booking_requests = current_provider.booking_requests
    render json: Provider::BookingRequestSerializer.new(@booking_requests).serializable_hash,
           status: :ok
  end
end
