class Api::V1::Provider::SessionsController < Api::V1::Provider::ApiController
  def create
    @provider = Provider.find_by(email: params[:email])
    if @provider && @provider.valid_password?(params[:password])
      render json: Provider::ProviderSerializer.new(@provider).serialized_json, status: :created
    else
      invalid_credentials
    end
  end
end
