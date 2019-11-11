require 'twilio-ruby'
class Sms       
    attr_reader :message

    # Used twilio api gem to send sms https://github.com/twilio/twilio-ruby

    def initialize(message)
        @message = message
    end

   
    def call
        client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
        client.messages.create({
            from: ENV['TWILIO_FROM'],
            to: ENV['TWILIO_TO'],
            body: message
        })
    end
end