class Api::V1::Provider::BookingsController < Api::V1::Provider::ApiController
  before_action :authenticate

  def index
    begin
      pagy, bookings = pagy(
        current_provider.bookings,
        items: params[:per_page],
        page: params[:page],
      )
      render json: Provider::BookingSerializer.new(bookings)
               .serializable_hash.merge(pagy: pagy), status: :ok
    rescue
      render json: { errors: ["Record was not found"] }, status: :not_found
    end
  end

  def show 
    @booking = current_provider.bookings.find(params[:id])
    render json: Provider::BookingSerializer.new(@booking).serializable_hash, status: :ok
  end
end
