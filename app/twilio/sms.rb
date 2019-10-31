require 'twilio-ruby'
class Sms       
    attr_reader :message

    def initialize(message)
        @message = message
    end

   
    def call
        client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
        client.messages.create({
            from: '+12248033166',
            to: '+14189285443',
            body: message
        })
    end
end