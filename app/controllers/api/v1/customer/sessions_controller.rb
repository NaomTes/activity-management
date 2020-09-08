class Api::V1::Customer::SessionsController < Api::V1::Customer::ApiController
  def create
    @customer = Customer.authenticate(params[:email], params[:password])
    return invalid_credentials unless @customer.present?
    render json: Customer::CustomerSerializer.new(@customer).serialized_json, status: :created
  end
end
