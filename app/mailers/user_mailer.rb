class UserMailer < ApplicationMailer

  def deleted_message(user)
    @user = user
    mail(to: @user.email, subject: "Your account has been removed from Rotten Mangoes")
  end
end
