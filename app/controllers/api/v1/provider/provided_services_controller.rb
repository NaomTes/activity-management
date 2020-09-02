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
    pagy, provided_services = pagy(current_provider.provided_services, items: params[:per_page], page: params[:page])
    render json: Provider::ProvidedServiceSerializer.new(provided_services)
             .serializable_hash.merge(pagy: pagy), status: :ok
  end

  def show
    @provided_service = current_provider.provided_services.find(params[:id])
    render json: Provider::ProvidedServiceSerializer.new(@provided_service).serialized_json,
           status: :ok
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
