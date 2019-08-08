class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        @login_url  = 'http://pets-rails.herokuapp.com/login'
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
