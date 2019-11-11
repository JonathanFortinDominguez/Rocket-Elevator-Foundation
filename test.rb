# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = 'ACeb4fac67f2c2cb5ad07f1366f172f592'
auth_token = '1ae78670916f0e393acaf66b2cd78534'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages.create(
                             from: ENV['TWILIO_FROM'],
                             body: 'Bonjour',
                             to: ENV['TWILIO_TO']
                           )

puts message.sid