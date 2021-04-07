class Api::V1::Investor::User::SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    render json: { user: resource }
  end
end