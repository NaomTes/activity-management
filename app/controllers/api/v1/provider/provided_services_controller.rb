class Api::V1::Provider::ProvidedServicesController < Api::V1::Provider::ApiController
  before_action :authenticate

  def create
    @provided_service = ProvidedService.new(provided_service_params)
    if @provided_service.save
      render json: Provider::ProvidedServiceSerializer.new(@provided_service).serialized_json,
             status: :created
    else
      unprocessable_entity @provided_service.errors
    end
  end

  private

  def provided_service_params
    params.require(:provided_service).permit(
      :price,
      :service_description,
      :provider_id,
      :service_id
    )
  end
end
