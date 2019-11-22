require 'rails_helper'
require 'elevator_media/streamer'
require 'rest-client'
require 'open_weather'
require 'rspotify'

describe ElevatorMedia::Streamer do
    
    let!(:streamer){ElevatorMedia::Streamer.new}

    it "tests for set-up" do
        expect(true).to be true
    end

    it "should be able to create with new" do
        expect(streamer).to be_a(ElevatorMedia::Streamer)
    end

    it "gets a response from getContent" do
        expect(streamer).to respond_to(:getContent)
    end
    
    describe "getContent behavior" do

        it "validates returning html" do
            valid = streamer.getContent()
            expect(valid).to be_a(String)
            expect(valid).to include('<')
            expect(valid).to include('>')
        end

        it "should get interesting html from API web services" do
            expect(streamer).to receive(:getNeededBroadcast)
            streamer.getContent()
        end

        it "should fetch a random dog image" do
            expect(streamer).to receive(:getRandomDogPicture).and_return({url: 'random dog'}.to_json)  
            streamer.getContent('dog_image')    
        end

        it "should fetch the current weather of Quebec City" do
            expect(streamer).to receive(:getCurrentWeather) {'current_weather'}
            streamer.getContent('current_weather')
        end

        it "should fetch the forecasted weather of Quebec City" do
            expect(streamer).to receive(:getForecastedWeather) {'weather_forecast'}
            streamer.getContent('weather_forecast')
        end

        it "should find User when streamer choose api type" do
            expect(streamer).to receive(:getSpotifyUser) {'spotify_user'}
            streamer.getContent('spotify_user')
        end

        it "was able to get a current weather response from API" do
            current = streamer.getCurrentWeather['weather'][0]['main']
            expect(current).to_not eq(nil)
        end

        it "was able to get a forecasted weather response from API" do
            forecast = streamer.getForecastedWeather["list"][0]['main']
            expect(forecast).to_not eq(nil)
        end

        it 'verifies if we got a spotify response' do
            expect(RSpotify).to receive(:raw_response) {true}
            confirmed_response = streamer.getSpotify
            expect(confirmed_response).to eq(true)
        end    

        it 'verifies if we logged in via authentication' do
            expect(RSpotify).to receive(:authenticate) {true}
            confirmed_auth = streamer.getSpotifyAuth
            expect(confirmed_auth).to eq(true)
        end    

        it 'verifies if we found a spotify user' do
            expect(RSpotify::User).to receive(:find) {'juanfdominguez'}
            confirmed_user = streamer.getSpotifyUser
            expect(confirmed_user).to eq('juanfdominguez')
        end    
    end
end
