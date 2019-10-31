class PagesController < ApplicationController
  require 'net/http'
  require 'json'

  def index


  end 

  def pages

  end

  def residentialService

  end

  def corporateService

  end

  def gmap

    
    
      @user = current_user
      if @user.nil?
        redirect_to main_app.root_path, :alert => "Need God power to access this page!"
      elsif !@user.admin?
        redirect_to main_app.root_path, :alert => "Need God power to access this page!"
      end
    

    

    Geocoder.configure(
      timeout: 15,                 # geocoding service timeout (secs)
      lookup: :google,            # name of geocoding service (symbol)
      api_key: ENV["GOOGLE_API_KEY"]           # API key for geocoding service
    )
    
    @coord_x = []
    @coord_y = []
    @customer_name = []
    @number_battery = []
    @number_column = []
    @number_elevator = []
    @service_name = []
    @markerList = []
    @weather = []

    options = { units: "metric", APPID: ENV['OPEN_WEATHER_KEY'] }

    for x in Building.all.each do

      test = Geocoder.search(Address.find(x.id).street_number)
      @t = test.first.coordinates

      temp = weather(x.address.city)

      @coord_x.push(@t[0])
      @coord_y.push(@t[1])

      @customer_name.push(x.customer.full_name)

      @number_battery.push(x.batteries.count)

      @number_column.push(x.batteries.columns.count)

      @number_elevator.push(Elevator.where(column_id: x.batteries).count)
    
      @service_name.push(x.customer.fullname_service_person)

      @markerList.push(x.id)

      @weather.push(temp)



    end

    p @markerList


    
  end
  
end
def weather(city)
  params = {
    :access_key => ENV['WEATHER_KEY'],
    :query => city
  }
  uri = URI('http://api.weatherstack.com/current')
  uri.query = URI.encode_www_form(params)
  json = Net::HTTP.get(uri)
  api_response = JSON.parse(json)
  weather = api_response['current']['temperature']
  return weather
end

