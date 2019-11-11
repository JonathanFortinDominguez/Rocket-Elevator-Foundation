class Elevator < ApplicationRecord
  require 'twilio-ruby'
  belongs_to :column
  has_many :interventions

  

after_update :send_message, :sms_status_change

def sms_status_change
  if status == "Intervention"
    message = "The elevator #{id} status has changed from #{previous_changes[:status][0]} to #{status}"
    Sms.new(message).call
  end 
end


def send_message
  puts "-------------------------"
  puts status
  if previous_changes[:status] != nil
    SlackNotifier::CLIENT.ping "The Elevator #{id} with Serial Number #{serial_number} changed status from #{previous_changes[:status][0]} to #{status}"
  
  end
end

end
