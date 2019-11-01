class Address < ApplicationRecord
    has_one :customer
    geocoded_by :street_number
    

end
