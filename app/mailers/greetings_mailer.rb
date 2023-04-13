class GreetingsMailer < ApplicationMailer
    default from: 'norelpy@exmaple.com'

    def welcome_email
        @user = params[:user]
        @url = 'http://localhost:3000'
        mail(to: @user.email, subject: 'Welcome email')
    end
end
