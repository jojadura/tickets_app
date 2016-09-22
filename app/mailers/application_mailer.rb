class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  @url  = 'http://example.com/blabla'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end



end
