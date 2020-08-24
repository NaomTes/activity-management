class Api::V1::Provider::ProvidersController < Api::V1::Provider::ApiController
  before_action :authenticate, only: [:auto_login, :update]
  before_action :set_provider, only: [:update]

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      token = JsonWebToken.encode({ provider_id: @provider.id })
      render json: { provider: @provider, token: token }
    else
      render json: { errors: @provider.errors.full_messages }
    end
  end

  def login
    @provider = Provider.find_by(email: params[:provider][:email])
    if @provider && @provider.valid_password?(params[:provider][:password])
      token = JsonWebToken.encode({ provider_id: @provider.id })
      render json: { provider: @provider, token: token }
    else
      render json: { error: "Invalid username or password" }
    end
  end

  def auto_login
    render json: { provider: current_provider }
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update(provider_params)
      render json: @provider
    else
      render json: { errors: @provider.errors.messages }
    end
  end

  private

  def provider_params
    params.require(:provider).permit(:email, :password, :password_confirmation,
                                     :first_name, :last_name, :address, :city,
                                     :phone_number, :state, :date_of_birth)
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end
end
