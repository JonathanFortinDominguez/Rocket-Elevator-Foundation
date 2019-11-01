require "ibm_watson/text_to_speech_v1"
require "json"
require "ibm_watson/authenticators"
require "swapi"
require 'net/http'
require 'json'

class TexttospeechController < ApplicationController
    include IBMWatson

    # https://github.com/watson-developer-cloud/ruby-sdk code came from an example from this github

    def create

      

    # Will print a JSON response with Luke Skywalker information
    # luke = Swapi.get_person 1

    random_call = rand(1..5)
    random_array = rand(0..2)


    swap_person = "https://swapi.co/api/people/#{random_call}/"
    swap_planets = "https://swapi.co/api/planets/#{random_call}/"
    swap_starships = "https://swapi.co/api/starships/#{random_call}/"

    swap_array = [swap_person, swap_planets, swap_starships] 
      choosen_one = swap_array.sample

      if choosen_one == swap_starships
        p "#{choosen_one} +++++++++++++++++++++++"
      end

      

    uri = URI(choosen_one)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
      

    if choosen_one == swap_starships
      swap_data_text = "Did you know that the #{data['name']} is a #{data['model']}, build buy #{data['manufacturer']} and cost #{data['cost_in_credits']} credits"
      elsif choosen_one == swap_planets
      swap_data_text = "Did you know that #{data['name']} has a #{data['climate']} climate, with a diameter of #{data['diameter']} kilometers and inhabits #{data['population']} living beings"
    elsif  choosen_one == swap_person
      swap_data_text = "Did you know that #{data['name']} is #{data['height']} centimeter tall and has #{data['hair_color']} hairs"
    end
    
    p swap_data_text

      authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
        apikey: ENV['WATSON']
      )
      text_to_speech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
      )

      text_to_speech.service_url = "https://gateway-syd.watsonplatform.net/text-to-speech/api"

      File::open("public/swap.wav", "wb") do |audio_file|
        response = text_to_speech.synthesize(
          text: swap_data_text,
          accept: "audio/wav",
          voice: "en-US_MichaelVoice"
        ).result
        audio_file << response
      end

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


# "Greetings #{current_user.employee.name}.
#           There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers. 
#           Currently, #{Elevator.where(status: 'Inactive').count} elevators are not in Running Status and are being serviced. 
#           You currently have #{Quote.count} quotes awaiting processing. 
#           You currently have #{Lead.count} leads in your contact requests. 
#           #{Battery.count} Batteries are deployed across #{Building.joins(:address).select('addresses.city').distinct.count} cities",