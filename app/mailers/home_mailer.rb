class HomeMailer < ApplicationMailer

  def contact_us
    @data = params
    mail(to: @data[:email], subject: "#{@data[:name]} contacted you from contact us page.")
  end
end
