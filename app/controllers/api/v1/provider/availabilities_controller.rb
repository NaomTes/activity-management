class Api::V1::Provider::AvailabilitiesController < Api::V1::Provider::ApiController
  before_action :authenticate

  def index
    availabilities = current_provider.availabilities.availabilities_by_month(params[:month])
    render json: Provider::AvailabilitySerializer.new(availabilities).serializable_hash,
           status: :ok
  end

  def show
    @availability = current_provider.availabilities.find(params[:id])
    render json: Provider::AvailabilitySerializer.new(@availability).serializable_hash,
           status: :ok
  end

  def destroy
    @availability = current_provider.availabilities.find(params[:id])
    if @availability.destroy
      render json: Provider::AvailabilitySerializer.new(@availability).serializable_hash,
             status: :ok
    end
  end
end
