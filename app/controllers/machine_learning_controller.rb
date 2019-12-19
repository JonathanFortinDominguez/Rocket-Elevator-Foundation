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
		
        uri = URI(ENV["AZURE_URL"])
        uri.query = URI.encode_www_form({
        })

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV["AZURE_SPEAKER"]
        # Request body
        request.body = local_body

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        jsonResponse = JSON.parse(response.body)

        @profile.name = params['Name']
        @profile.profile_id = jsonResponse['identificationProfileId']
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

		@profile = Profile.where(profile_id: profileId).take

		uri = URI(ENV["AZURE_URL"]+ profileId)
		uri.query = URI.encode_www_form({
		})

		request = Net::HTTP::Delete.new(uri.request_uri)
		# Request headers
		request['Ocp-Apim-Subscription-Key'] = ENV["AZURE_SPEAKER"]

		response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
			http.request(request)
		end

		@profile.destroy

		redirect_to delete_profile_path(deletedProfileLanguage: @profile.language, deletedProfileSpeech: @profile.profile_id, deletedProfileName: @profile.name)
	end

	def enroll
		@audio = params['Attachment']

		profile = params['profile'].to_str

		@profile = Profile.where(profile_id: profile).take

		uri = URI(ENV["AZURE_URL"] + profile + '/enroll')

		request = Net::HTTP::Post.new(uri.request_uri)
		# Request headers
		request['Content-Type'] = 'audio/vnd.wave'
		# Request headers
		request['Ocp-Apim-Subscription-Key'] = ENV["AZURE_SPEAKER"]
		# Request body
		request.body = File.read(@audio.path)

		response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
			http.request(request)
		end

		operationUrl = response.header['operation-location']

		uri = URI(operationUrl)
		uri.query = URI.encode_www_form({
		})

		sleep 20

		request = Net::HTTP::Get.new(uri.request_uri)
		# Request headers
		request['Ocp-Apim-Subscription-Key'] = ENV["AZURE_SPEAKER"]

		response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
			http.request(request)
		end

		sleep 15

		result = JSON.parse(response.body)


		if result['status'] == "succeeded"
			@profile.enrolled = true
			@profile.save!

			redirect_to confirm_enroll_path(profilName: @profile.name, operationStatus: result['status'], enrollementStatus: result['processingResult']['enrollmentStatus'])
		end

	end

	def recognize
		
        @audio = params['recognize_audio']
		profileId = params["enrolled_profile"].to_str
        profileToidentify = Profile.where(profile_id: profileId).take

        uri = URI(ENV["AZURE_URL2"] + profileId)

        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'audio/vnd.wave'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV["AZURE_SPEAKER"]
        # Request body
        request.body = File.read(@audio.path)
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
		end
		sleep 15
		operationUrl = response.header['Operation-Location']

        p "======================================="
        p response.header
		uri = URI(operationUrl)
		uri.query = URI.encode_www_form({
		})
        sleep 15
		request = Net::HTTP::Get.new(uri.request_uri)
		# Request headers
		request['Ocp-Apim-Subscription-Key'] = ENV["AZURE_SPEAKER"]

		response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
			http.request(request)
		end

		result = JSON.parse(response.body)
        p "ffffffffffffffffffffffff"
        p result.to_json
		identifiedProfile = Profile.where(profile_id: result['processingResult']['identifiedProfileId']).take


		uri = URI(ENV["AZURE_URL2"])
		
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
		sleep 10
		
		result2 = JSON.parse(response2.body)
		redirect_to identified_profile_path(identifiedId: identifiedProfile, operationStatus: result['status'], confidence: result['confidence'], text: result2['DisplayText'])

end
end
