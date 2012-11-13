class UserMailer < ActionMailer::Base
  default from: "schoolrun@dcafsnelling.co.uk"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password.subject
  #
  def reset_password
    @greeting = "Hi - resetting password"

    mail to: "success@simulator.amazonses.com", subject: "Reset Password"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_driver.subject
  #
  def new_driver
    @greeting = "Claire has taken over driving duties"

    mail to: "schoolrun@dcafsnelling.co.uk", subject: "Schoolrun - Driver Takeover"

  end
end
