class Address < ApplicationRecord
    has_one :customer
    has_one :building
    geocoded_by :street_number
    

end
