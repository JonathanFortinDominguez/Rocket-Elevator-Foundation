require './lib/tasks/zendesk.rb'

class Intervention < ApplicationRecord
    belongs_to :author, class_name: "Employee"
    belongs_to :customer, optional: false
    belongs_to :building, optional: false
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true
    belongs_to :employee, class_name: "Employee", optional: true

    def get_intervention_battery
        zendesk = Zendesk.new
        
        zendesk.get_an_intervention_battery(self.id)
        
    end 

    def get_intervention_column
        zendesk = Zendesk.new
        
        zendesk.get_an_intervention_column(self.id)
        
    end 

    def get_intervention_elevator
        zendesk = Zendesk.new
        
        zendesk.get_an_intervention_elevator(self.id)
        
    end 
end


