require 'elevator_media/streamer'
require 'rest-client'
require 'open_weather'
require 'rspotify'

module ElevatorMedia    
    class Streamer 

        def getContent(api='dog_image')
            getNeededBroadcast(api)
        end

        def getNeededBroadcast(api)

            # The test worked this way, but I couldn't render it on the index that way

            # if api == 'dog_image'
            #     return "<div class='media_streamer'><img src=#{JSON.parse(self.getRandomDogPicture)['url']}></div>"
            # end

            # Took out "<div class='media_streamer'><img src=" and "></div> so I could render the image on the index.
            
            if api == 'dog_image'
                return "#{JSON.parse(self.getRandomDogPicture)['url']}"
            end

            if api == 'current_weather'
                return "<div class='media_streamer'>#{self.getCurrentWeather}</div>"
            end

            if api == 'weather_forecast'
                return "<div class='media_streamer'>#{self.getForecastedWeather}</div>"
            end

            if api == 'spotify_user'  
                return "<div class='media-streamer'>#{self.getSpotifyUser}</div>"  
            end 
        end

        def getRandomDogPicture
            response = RestClient::Request.execute(method: :get, url: 'https://random.dog/woof.json', header: {})
        end

        def getCurrentWeather
            param_values = { units: "metric", APPID: ENV['OPENWEATHER_KEY'] }
            OpenWeather::Current.city("Quebec City, CA", param_values)
        end

        def getForecastedWeather
            param_values = { units: "metric", APPID: ENV['OPENWEATHER_KEY'] }
            OpenWeather::Forecast.city("Quebec City, CA", param_values)
        end

        def getSpotify
            RSpotify.raw_response = true
            spotify = RSpotify.raw_response
        end
 
        def getSpotifyAuth
            status = RSpotify::authenticate(ENV['SPOTIFY_CLIENTID'], ENV['SPOTIFY_SECRET'])
        end
 
        def getSpotifyUser
            user = RSpotify::User.find('juanfdominguez')
        end
    end
end

