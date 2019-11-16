require 'zendesk_api'
class Zendesk
    def initialize
        
        # Code found in zendesk api gem https://github.com/zendesk/zendesk_api_client_rb

        @client = ZendeskAPI::Client.new do |config|
            # Mandatory:

            config.url = "https://rocketelevatorsquebec.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

            # Basic / Token Authentication
            config.username = "jonathanfdominguez@gmail.com"

            config.token = ENV['ZENDESK_TOKEN']
        end
    end


    def get_a_quote(full_name, company_name, email, phone_number, project_name)
        ZendeskAPI::Ticket.create(@client, :subject => "#{full_name} from #{company_name}", :description => "Create Ticket", :comment => { :value => "The contact #{full_name} from company #{company_name} can be reached at email #{email} and at phone number #{phone_number}. #{company_name} has a project named #{project_name} which would require contribution from Rocket Elevators."}, :submitter_id => @client.current_user.id, :type => "task", :priority => "urgent")
    end  

    def contact_us(full_name, company_name, email, phone_number, elevator_department, project_name, project_description, message)
        ZendeskAPI::Ticket.create(@client, :subject => "#{full_name} from #{company_name}", :description => "Create Ticket", :comment => { :value => "The contact #{full_name} from company #{company_name} can be reached at email #{email} and at phone number #{phone_number}. #{elevator_department} has a project named #{project_name} which would require contribution from Rocket Elevators.\n#{project_description}\nAttached Message: #{message}"}, :submitter_id => @client.current_user.id, :type => "question", :priority => "urgent")
    end
    
    def get_an_intervention_battery(author_name, business_name, building_nb, admin_fullname, address_number, address_city, battery_nb, employee_name, report_info) 
        ZendeskAPI::Ticket.create(@client, :subject => "#{author_name} created an intervention for #{employee_name} for a battery", :description => "Create Ticket", :comment => { :value => "According to #{author_name}, the company #{business_name} needs some work to be done on their building number #{building_nb}. It is situated at #{address_number} in #{address_city} and it is being administrated by #{admin_fullname}. The problem seems to be on their battery number #{battery_nb}. #{employee_name} has been tasked to resolve the issue for #{business_name} and the following report has been filed: #{report_info}."}, :submitter_id => @client.current_user.id, :type => "problem", :priority => "urgent")
    end

    def get_an_intervention_column(author_name, business_name, building_nb, admin_fullname, address_number, address_city, column_nb, employee_name, report_info)
        ZendeskAPI::Ticket.create(@client, :subject => "#{author_name} created an intervention for #{employee_name} for a column", :description => "Create Ticket", :comment => { :value => "According to #{author_name}, the company #{business_name} needs some work to be done on their building number #{building_nb}. It is situated at #{address_number} in #{address_city} and it is being administrated by #{admin_fullname}. The problem seems to be on their column number #{column_nb}. #{employee_name} has been tasked to resolve the issue for #{business_name} and the following report has been filed: #{report_info}."}, :submitter_id => @client.current_user.id, :type => "problem", :priority => "urgent")
    end
    
    def get_an_intervention_elevator(author_name, business_name, building_nb, admin_fullname, address_number, address_city, elevator_nb, employee_name, report_info)
        ZendeskAPI::Ticket.create(@client, :subject => "#{author_name} created an intervention for #{employee_name} for an elevator", :description => "Create Ticket", :comment => { :value => "According to #{author_name}, the company #{business_name} needs some work to be done on their building number #{building_nb}. It is situated at #{address_number} in #{address_city} and it is being administrated by #{admin_fullname}. The problem seems to be on their elevator number #{elevator_nb}. #{employee_name} has been tasked to resolve the issue for #{business_name} and the following report has been filed: #{report_info}."}, :submitter_id => @client.current_user.id, :type => "problem", :priority => "urgent")
    end
  
end