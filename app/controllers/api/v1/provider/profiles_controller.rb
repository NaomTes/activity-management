class Api::V1::Provider::ProfilesController < Api::V1::Provider::ApiController
  before_action :authenticate, only: [:update]
  before_action :set_provider, only: [:update]

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      render json: Provider::ProviderSerializer.new(@provider).serialized_json, status: :created
    else
      unprocessable_entity @provider.errors
    end
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update(provider_params)
      render json: Provider::ProviderSerializer.new(@provider).serialized_json, status: :created
    else
      unprocessable_entity @provider.errors
    end
  end

  private

  def provider_params
    params.require(:provider).permit(
      :email,
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
      :country,
      provided_services_attributes: [
        :service_id,
        :service_description,
        :price,
      ],
    )
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end
end
