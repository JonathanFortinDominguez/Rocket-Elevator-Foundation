class MachineLearningController < ApplicationController
    skip_before_action :verify_authenticity_token
    require 'net/http'
    require 'json'

    def createProfile
        @profile = Profile.new
        language = params['language']
        if language == 'french'
            local_body = {
                "locale":"fr-FR"
            }.to_json
        elsif language == 'english'
            local_body = {
                "locale":"en-us"
            }.to_json
        end

        uri = URI('https://rocketspeakerrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles')
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = "2c7952cd710e4c34a3ac9e629ed950ef"
        # Request body
        request.body = local_body

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        jsonResponse = JSON.parse(response.body)

        @profile.name = params['Name']
        @profile.speech_id = jsonResponse['identificationProfileId']
        @profile.enrolled = false
        @profile.language = language

        @profile.save!

        @name = params['Name']
        @ID = jsonResponse['identificationProfileId']
        @language = language
        redirect_to confirm_profile_path
    end

    def deleteProfile
        profileId = params['profile'].to_str

        @profile = Profile.where(speech_id: profileId).take

        uri = URI("https://rocketspeakerrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/"+ profileId)
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Delete.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = "2c7952cd710e4c34a3ac9e629ed950ef"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        @profile.destroy

        # redirect_to delete_profile_path(deletedProfileLanguage: @profile.language, deletedProfileSpeech: @profile.speech_id, deletedProfileName: @profile.name)
    end

    def enroll
        @audio = params['Attachment']

        profile = params['profile'].to_str

        @profile = Profile.where(speech_id: profile).take

        uri = URI('https://rocketspeakerrecognition.cognitiveservices.azure.com/spid/v1.0/identificationProfiles/' + profile + '/enroll')

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'audio/vnd.wave'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = "2c7952cd710e4c34a3ac9e629ed950ef"
        # Request body
        request.body = File.read(@audio.path)

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        sleep 10
        opertionUrl = response.header['operation-location']

        uri = URI(opertionUrl)
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = "2c7952cd710e4c34a3ac9e629ed950ef"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        result = JSON.parse(response.body)

        p result

        if result['status'] == "succeeded"
            @profile.enrolled = true
            @profile.save!
        end


        # redirect_to confirm_enroll_path(profile_name: @profile.name, operationnal_status: result['status'], enrollement_status: result['processingResult']['enrollmentStatus'])
    end

    def recognize
        profileId = params['theprofile'].to_str

        @audio = params['Audio']

        uri = URI('https://rocketspeakerrecognition.cognitiveservices.azure.com/spid/v1.0/identify?identificationProfileIds='+profileId)

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'audio/vnd.wave'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = "2c7952cd710e4c34a3ac9e629ed950ef"
        # Request body
        request.body = File.read(@audio.path)

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        puts response.header['operation-location']

        sleep 10
        opertionUrl = response.header['operation-location']

        uri = URI(opertionUrl)
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = "2c7952cd710e4c34a3ac9e629ed950ef"

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        result = JSON.parse(response.body)

        identifiedProfile = Profile.where(speech_id: result['processingResult']['identifiedProfileId']).take


        uri = URI('https://westus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?language=en-US')

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'audio/vnd.wave'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV["AZURE_SPEECH"]
        # Request body
        request.body = File.read(@audio.path)

        response2 = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        result2 = JSON.parse(response2.body)

        uri = URI('https://rocketspeakerrecognition.cognitiveservices.azure.com/spid/v1.0/identify?identificationProfileIds='+profileId)


        # redirect_to identified_profile_path(operationnal_status: result['status'], identifiedId: result['processingResult']['identifiedProfileId'], identifiedName: identifiedProfile.name, identifiedLanguage: identifiedProfile.language, confidence: result['processingResult']['confidence'], text: result2['DisplayText'])
    end

end