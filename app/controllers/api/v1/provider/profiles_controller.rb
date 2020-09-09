class Api::V1::Provider::ProfilesController < Api::V1::Provider::ApiController
  before_action :authenticate, only: [:update]
  before_action :set_provider, only: [:update, :show]

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      render json: Provider::ProviderSerializer.new(@provider, { params: { auth_token: true } }).serialized_json,
             status: :created
    else
      unprocessable_entity @provider.errors
    end
  end

  def index
    @providers = Provider.filter(params[:service])
    render json: Provider::ProviderSerializer.new(@providers).serialized_json, status: :ok
  end

  def update
    if @provider.update(provider_params)
      render json: Provider::ProviderSerializer.new(@provider).serialized_json, status: :created
    else
      unprocessable_entity @provider.errors
    end
  end

  def show
    @reviews = @provider.reviews
    render json: Provider::ReviewSerializer.new(@reviews).serialized_json, status: :ok
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
