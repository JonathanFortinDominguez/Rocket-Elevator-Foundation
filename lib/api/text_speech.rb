require "ibm_watson/text_to_speech_v1"
class Watson
    include IBMWatson

    # def initialize
    #     @text_to_speech = TextToSpeechV1.new(
    #         iam_apikey: ENV['TEXT_TO_SPEECH_IAM_APIKEY'],
    #         url: "https://gateway-syd.watsonplatform.net/text-to-speech/api"
    #     )
    # end
    
    # def create_synthesized_audio    
    #     response = @text_to_speech.synthesize(
    #         text: "Greetings to the logged users",
    #         accept: "audio/wav",
    #         voice: "en-US_AllisonVoice"
    #     )
  
    #     return response.result 
    # end

    def create_synthesized_audio    
        response = api.synthesize(
            text: "Greetings to the logged users",
            accept: "audio/wav",
            voice: "en-US_AllisonVoice"
        )
  
        return response.result 
    end

    private 

    def api 
        return TextToSpeechV1.new(
            iam_apikey: ENV['TEXT_TO_SPEECH_IAM_APIKEY'],
            url: "https://gateway-syd.watsonplatform.net/text-to-speech/api"
        )
    end
end    
# There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers. 
# Currently, #{Elevator.where(status: 'Inactive').count} elevators are not in Running Status and are being serviced. 
# You currently have #{Quote.count} quotes awaiting processing. 
# You currently have #{Lead.count} leads in your contact requests. 
# #{Battery.count} Batteries are deployed across #{Building.joins(:adress).select('adresses.city').distinct.count} cities",