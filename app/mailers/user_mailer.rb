class UserMailer < ActionMailer::Base
  default from: "renuka.joshi92@gmail.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
