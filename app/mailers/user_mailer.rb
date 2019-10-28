class UserMailer < ApplicationMailer
    default from: 'notifications@rocketelevators.com'

    def welcome_email
        @user = params[:user]
        @url  = 'http://rocketelevator.website/users/sign_in'
        mail(to: @user.email, subject: 'Welcome to Rocket Elevators')
      end

end
