class UserMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail(to: user.email, subject: 'votre inscription sur le site')
  end
end
