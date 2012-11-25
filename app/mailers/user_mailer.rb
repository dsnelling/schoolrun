class UserMailer < ActionMailer::Base
  default from: "schoolrun@dcafsnelling.co.uk"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
    logger.debug "user mail sent to #{user.email} - Password Reset"
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

  def test_email
    # test email
    mail :to => "schoolrun@dcafsnelling.co.uk", :subject => "Test email"
    logger.debug "test email sent to schoolrun@dcafsnelling.co.uk....."
  end

  def notification(params)
    attachments.inline['heading_s.png'] = File.read(Rails.root.join("app",
       "assets","images","heading_s.png"))
    @message = params[:message]
    user = params[:user]
    email_with_name = "#{user.first_name} #{user.surname} <#{user.email}>"
    mail :to => email_with_name, :subject => "Schoolrun message"
    logger.debug "notification emails sent to #{user.email}"
  end
    
end
