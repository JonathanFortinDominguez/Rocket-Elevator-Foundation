require "ibm_watson/text_to_speech_v1"
require "json"
require "ibm_watson/authenticators"

class TexttospeechController < ApplicationController
    include IBMWatson

    def create
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
        apikey: ENV['WATSON']
      )
      text_to_speech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
      )
      text_to_speech.service_url = "https://gateway-syd.watsonplatform.net/text-to-speech/api"

       #File.open() do |audio_file|
      File::open("public/output.wav", "wb") do |audio_file|
        response = text_to_speech.synthesize(
          text: "Greetings #{current_user.employee.name}.
          There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers. 
          Currently, #{Elevator.where(status: 'Inactive').count} elevators are not in Running Status and are being serviced. 
          You currently have #{Quote.count} quotes awaiting processing. 
          You currently have #{Lead.count} leads in your contact requests. 
          #{Battery.count} Batteries are deployed across #{Building.joins(:address).select('addresses.city').distinct.count} cities",
          accept: "audio/wav",
          voice: "en-US_MichaelVoice"
        ).result
        audio_file << response  
        render 'index'
         
      end
    end
end
