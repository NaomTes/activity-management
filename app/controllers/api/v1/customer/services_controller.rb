class Api::V1::Customer::ServicesController < Api::V1::Customer::ApiController
  def index
    @services = Service.all
    render json: Customer::ServiceSerializer.new(@services).serialized_json, status: :ok
  end
end
