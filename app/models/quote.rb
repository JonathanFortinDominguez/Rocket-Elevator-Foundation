require './lib/api/zendesk.rb'

class Quote < ApplicationRecord
    include RailsAdminCharts
    
    def self.chart_type
        "column"
    end

    def get_quote
        zendesk = Zendesk.new
        
        zendesk.get_a_quote(self.Full_Name, self.Business_Name, self.Email_Address, self.Phone_Number)
    end 
end
