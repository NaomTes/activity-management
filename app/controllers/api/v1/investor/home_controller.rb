class Api::V1::Investor::HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:contact_us]

  def contact_us
    HomeMailer.with(contact_us_params).contact_us.deliver_later

    render json: { message: "Email Sent Successfully" }
  end

  private

  def contact_us_params
    params.require(:contact_us).permit(:name, :email, :phone, :company, :message)
  end
end
