class SendMailer < ApplicationMailer

  def comment_email current_u, user,support, comment
    @current_user = current_u
    @user= user
    @comment = comment
    @support= support
    mail(to: @user.email, subject: '[soporte] #{@support.title}')
  end

end
