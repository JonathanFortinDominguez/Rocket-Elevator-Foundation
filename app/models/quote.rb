require './lib/tasks/zendesk.rb'

class Quote < ApplicationRecord
    


    def get_quote
        zendesk = Zendesk.new
        
        zendesk.get_a_quote(self.Full_Name, self.Business_Name, self.Email_Address, self.Phone_Number, self.Project_Name)
        
    end 
end
