class UserMailer < ApplicationMailer
  default from: 'railslibrary517@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def send_email(user, book)
    @user = user
    @book = book
    mail(to: @user.email, subject: 'Library book is now available')
  end
end
