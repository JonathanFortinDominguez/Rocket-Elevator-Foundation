class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  
  def index
    @quotes = Quote.new
  end
  

  def new

    @quotes = Quote.new
  
  end


  def create 
    # taker building type in params
    buildingType = params['building_type']

    # taker building params in params Residential
    numAppResidential = params['numAppResidential']
    numFloorResidential = params['numFloorResidential']
    numBasementResidential = params['numBasementResidential']

    # taker building params in params Commercial
    numberBuissinessCommercial = params['numberBuissinessCommercial']
    numberFloorCommercial = params['numberFloorCommercial']
    numberBasementCommercial = params['numberBasementCommercial']
    numberParkingCommercial = params['numberParkingCommercial']
    numberShaftCommercial = params['numberShaftCommercial']

    # taker building params in params Corporate
    numberBuissinessCorporate = params['numberBuissinessCorporate']
    numberFloorCorporate = params['numberFloorCorporate']
    numBasementCorporate = params['numBasementCorporate']
    numberParkingCorporate = params['numberParkingCorporate']
    numberTenantCorporate = params['numberTenantCorporate']

    # taker building params in params Hybrid
    numberBuissinessHybrid = params['numberBuissinessHybrid']
    numberFloorHybrid = params['numberFloorHybrid']
    numBasementHybrid = params['numBasementHybrid']
    numberParkingHybrid = params['numberParkingHybrid']
    numberTenantHybrid = params['numberTenantHybrid']

    #contact
    fullname_ = params['fullName']
    buisinessName = params['BuissinessName']
    adress_ = params['Adress']
    projectName_ = params['ProjectName']
    emailAddress_ = params['emailAddress']
    phoneNumber_ = params['phoneNumber']

    # taker quality in params
    quality = params['quality']

    # take price params
    numberElevator = params['numberElevator']
    installPrice = params['installPrice']
    totalPrice = params['totalPrice']

    @quotes = Quote.new

    @quotes.buildingType = buildingType
    if buildingType == "Residential"
      @quotes.numberApp = numAppResidential
      @quotes.numberFloor = numFloorResidential
      @quotes.numberBasement = numBasementResidential
      @quotes.totalPrice = totalPrice
      @quotes.installationPrice = installPrice
      @quotes.numberElevators = numberElevator

    end

    if buildingType == "Commercial"
      @quotes.numberBuisiness = numberBuissinessCommercial
      @quotes.numberFloor = numberFloorCommercial
      @quotes.numberBasement = numberBasementCommercial
      @quotes.numberParking = numberParkingCommercial
      @quotes.numberShaft = numberShaftCommercial
      @quotes.totalPrice = totalPrice
      @quotes.installationPrice = installPrice
      @quotes.numberElevators = numberElevator

    end

    if buildingType == "Corporate"
      @quotes.numberBuisiness = numberBuissinessCorporate
      @quotes.numberFloor = numberFloorCorporate
      @quotes.numberBasement = numBasementCorporate
      @quotes.numberParking = numberParkingCorporate
      @quotes.numberTenant = numberTenantCorporate
      @quotes.totalPrice = totalPrice
      @quotes.installationPrice = installPrice
      @quotes.numberElevators = numberElevator
    end  

    if buildingType == "Hybrid"
      @quotes.numberBuisiness = numberBuissinessHybrid
      @quotes.numberFloor = numberFloorHybrid
      @quotes.numberBasement = numBasementHybrid
      @quotes.numberParking = numberParkingHybrid
      @quotes.numberTenant = numberTenantHybrid
      @quotes.totalPrice = totalPrice
      @quotes.installationPrice = installPrice
      @quotes.numberElevators = numberElevator
    end  

    @quotes.Full_Name = fullname_
    @quotes.Address = adress_
    @quotes.Business_Name = buisinessName
    @quotes.Project_Name = projectName_
    @quotes.Email_Address =  emailAddress_ 
    @quotes.Phone_Number = phoneNumber_

    @quotes.save!
    @quotes.get_quote
    redirect_to root_path

    

  end

  def index 
    @quotes = Quote.all
  end 

  def show
  end

  def edit
  end










end
