class Api::V1::Customer::BookingsController < Api::V1::Customer::ApiController
  before_action :authenticate

  def index
    begin
      pagy, bookings = pagy(
        current_customer.bookings,
        items: params[:per_page],
        page: params[:page],
      )
      render json: Customer::BookingSerializer.new(bookings)
               .serializable_hash.merge(pagy: pagy), status: :ok
    rescue
      render json: { errors: ["Record was not found"] }, status: :not_found
    end
  end
end
