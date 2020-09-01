class Api::V1::Provider::ApiController < ActionController::API
  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def current_provider
    @current_provider
  end

  protected

  def set_current_provider(provider)
    @current_provider = provider
  end

  def auth_token
    @auth_token = JsonWebToken.decode(http_token)
  end

  def http_token
    @http_token = request.headers["AUTH-TOKEN"]
  end

  def provider_id_in_token?
    http_token && auth_token && !auth_token.is_a?(String) && auth_token[:provider_id].to_i
  end

  def authenticate_token
    return false unless provider_id_in_token?
    provider = Provider.find_by(id: auth_token[:provider_id])
    return false unless provider.present?
    set_current_provider(provider)
    return true
  end

  def not_authenticated
    render json: { errors: ["User not authorized"] }, status: :unauthorized
    return
  end

  def authenticate
    authenticate_token || not_authenticated
  end

  def unprocessable_entity(errors)
    render json: { errors: errors }, status: :unprocessable_entity
    return
  end

  def invalid_credentials
    render json: { errors: ["Invalid Credentials"] }, status: :unauthorized
    return
  end

  private

  def record_not_found
    render json: { errors: ["Object was not found"] }, status: :not_found
  end
end
