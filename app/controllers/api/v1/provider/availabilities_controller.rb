class Api::V1::Provider::AvailabilitiesController < Api::V1::Provider::ApiController
  before_action :authenticate

  def index
    availabilities = current_provider.availabilities.availabilities_by_month(params[:month])
    render json: Provider::AvailabilitySerializer.new(availabilities).serializable_hash,
           status: :ok
  end
end
