class HomeMailer < ApplicationMailer

  def contact_us
    @data = params
    mail(subject: "#{@data[:name]} contacted you from contact us page.")
  end
end
