class PagesController < ApplicationController
 

  def index


  end 

  def pages

  end

  def residentialService

  end

  def corporateService

  end

  def gmap

    @coord_x = []
    @coord_y = []
    @customer_name = []
    @number_battery = []
    @number_column = []
    @number_elevator = []
    @service_name = []

    for x in Building.all.each do

      test = Geocoder.search(Address.find(x.id).street_number)
      @t = test.first.coordinates

      @coord_x.push(@t[0])
      @coord_y.push(@t[1])

      @customer_name.push(x.customer.full_name)

      @number_battery.push(x.batteries.count)

      @number_column.push(x.batteries.columns.count)

      @number_elevator.push(Elevator.where(column_id: x.batteries).count)
    
      @service_name.push(x.customer.fullname_service_person)
    end
    p @coord_x
    p @coord_y


    
  end
  

  

end
