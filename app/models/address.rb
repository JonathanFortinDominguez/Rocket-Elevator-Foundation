class Address < ApplicationRecord
    include RailsAdminCharts
    has_one :customer

    def self.chart_type
        "column"
    end

end
