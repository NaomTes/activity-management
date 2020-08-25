class Api::V1::Provider::SessionsController < Api::V1::Provider::ApiController
  def create
    @provider = Provider.authenticate(params[:email], params[:password])
    return invalid_credentials unless @provider.present?
    render json: Provider::ProviderSerializer.new(@provider).serialized_json, status: :created
  end
end
