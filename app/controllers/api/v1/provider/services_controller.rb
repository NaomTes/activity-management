class Api::V1::Provider::ServicesController < Api::V1::Provider::ApiController
  def index
    @services = Service.all
    render json: Provider::ServiceSerializer.new(@services).serialized_json, status: :ok
  end
end
