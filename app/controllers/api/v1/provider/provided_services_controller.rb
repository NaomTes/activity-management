class Api::V1::Provider::ProvidedServicesController < Api::V1::Provider::ApiController
  before_action :authenticate

  def create
    @provided_service = current_provider.provided_services.build(provided_service_params)
    if @provided_service.save
      render json: Provider::ProvidedServiceSerializer.new(@provided_service).serialized_json,
             status: :created
    else
      unprocessable_entity @provided_service.errors
    end
  end

  def index
    @provided_services = current_provider.provided_services
    render json: Provider::ProvidedServiceSerializer.new(@provided_services)
  end

  private

  def provided_service_params
    params.require(:provided_service).permit(
      :price,
      :service_description,
      :service_id,
      :status
    )
  end
end
