class Api::V1::Provider::ProvidedServicesController < Api::V1::Provider::ApiController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authenticate
  before_action :set_provided_service, only: [:show, :update]

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
    begin
      pagy, provided_services = pagy(current_provider.provided_services, items: params[:per_page], page: params[:page])
      render json: Provider::ProvidedServiceSerializer.new(provided_services)
               .serializable_hash.merge(pagy: pagy), status: :ok
    rescue
      render json: { errors: ["Record was not found"] }, status: :not_found
    end
  end

  def show
    render json: Provider::ProvidedServiceSerializer.new(@provided_service).serialized_json,
           status: :ok
  end

  def update
    if @provided_service.update(provided_service_params)
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
      :service_id,
      :status
    )
  end

  def set_provided_service
    @provided_service = current_provider.provided_services.find(params[:id])
  end

  def record_not_found
    render json: { errors: ["Record not found"] }, status: :not_found
  end
end
