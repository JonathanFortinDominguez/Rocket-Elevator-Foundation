class Address < ApplicationRecord
    include RailsAdminCharts
    has_one :customer
    geocoded_by :street_number
    def self.chart_type
        "column"
    end

end
