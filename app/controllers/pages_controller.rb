class PagesController < ApplicationController
  require 'net/http'
  require 'json'
  skip_before_action :verify_authenticity_token
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
    

    
      # from geocoder gem github 
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



    # Google map info 
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
 #Used weather stack code from https://weatherstack.com/documentation and the help of windor
def create 
      
  fullname = params['fullnameContact']
  businessName = params['businessNameContact']
  email = params['emailContact']
  phone = params['phoneContact']
  projectName = params['projectNameContact']
  desc = params['projectDescContact']
  department = params['department']
  message = params['messageContact']
  attach = params['attachment']
  @leads = Lead.new

  @leads.fullname = fullname
  @leads.businessName = businessName
  @leads.email = email
  @leads.phoneNumber = phone
  @leads.projectName = projectName
  @leads.projectDescription = desc
  @leads.departement = department
  @leads.message = message
  @leads.attachment_file = attach
 
  @leads.follow_up_date = Time.current


  # add file ext to upload file in dropbox
  if @leads.attachment_file != nil
    file_name = @leads.attachment_file.original_filename
    @leads.attachment_file = @leads.attachment_file.read
    @leads.original_file_name = file_name
  end


  @leads.attachment.attach(params[:attachment])
  @leads.save!

  
  # https://www.youtube.com/watch?v=Ul3ODrsJyJ0 to help use sendgrid with mailer action
  #UserNotifierMailer.send_signup_email(@leads).deliver
  @leads.contact

  redirect_to root_path


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

