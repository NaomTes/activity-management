class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@vcconnector.com'
  default to: 'vcconnector1@gmail.com'

  layout 'mailer'
end
