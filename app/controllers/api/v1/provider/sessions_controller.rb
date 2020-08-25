class Api::V1::Provider::SessionsController < Api::V1::Provider::ApiController
  def create
    @provider = Provider.find_by(email: params[:provider][:email])
    if @provider && @provider.valid_password?(params[:provider][:password])
      token = JsonWebToken.encode({ provider_id: @provider.id })
      render json: { provider: @provider, token: token }
    else
      render json: { error: "Invalid email or password" }
    end
  end
end
