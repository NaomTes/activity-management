class Api::V1::Provider::ProfilesController < Api::V1::Provider::ApiController
  before_action :authenticate, only: [:update]
  before_action :set_provider, only: [:update]

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      json_string = ProviderSerializer.new(@provider).serialized_json
      render json: json_string
    else
      render json: { errors: @provider.errors.full_messages }
      # invalid_credentials
    end
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update(provider_params)
      render json: @provider
    else
      render json: { errors: @provider.errors.full_messages }
    end
  end

  private

  def provider_params
    params.require(:provider)
      .permit(:email,
              :password,
              :password_confirmation,
              :first_name,
              :last_name,
              :age,
              :profile_description,
              :base_price,
              :street,
              :city,
              :postal_code,
              :country)
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end
end
