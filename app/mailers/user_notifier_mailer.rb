class UserNotifierMailer < ApplicationMailer
    default :from => 'rocketelevator@codeboxx.biz'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(lead)
      @leads = lead
      mail( :to => @leads.email,
      :subject => 'Thanks for sending us your Message',
       )
    end
end