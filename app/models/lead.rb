require './lib/tasks/zendesk.rb'

class Lead < ApplicationRecord
    has_one_attached :attachment
    belongs_to :customer, optional: true
    




    def contact
        zendesk = Zendesk.new
        zendesk.contact_us(self.fullname, self.businessName, self.email, self.phoneNumber, self.departement, 
            self.projectName, self.projectDescription, self.message)
    end    

end
