require 'zendesk_api'
class Zendesk
    def initialize
        
        @client = ZendeskAPI::Client.new do |config|
            # Mandatory:

            config.url = "https://rocketapi.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

            # Basic / Token Authentication
            config.username = "christo.hardoin@gmail.com"

            config.token = ENV['ZENDESK_TOKEN']
        end
    end


    def get_a_quote(full_name, company_name, email, phone_number)
        ZendeskAPI::Ticket.create(@client, :subject => "#{full_name} from #{company_name}", :decription => "Create Ticket", :comment => { :value => "The contact #{full_name} from company #{company_name} can be reached at email #{email} and at phone number #{phone_number}."}, :submitter_id => @client.current_user.id, :type => "task", :priority => "urgent")
    end  

    def contact_us(full_name, company_name, email, phone_number, elevator_department, project_name, project_description, message)
        ZendeskAPI::Ticket.create(@client, :subject => "#{full_name} from #{company_name}", :decription => "Create Ticket", :comment => { :value => "The contact #{full_name} from company #{company_name} can be reached at email #{email} and at phone number #{phone_number}. #{elevator_department} has a project named #{project_name} which would require contribution from Rocket Elevators.\n#{project_description}\nAttached Message: #{message}\nThe Contact uploaded an attachment."}, :submitter_id => @client.current_user.id, :type => "question", :priority => "urgent")
    end
    
  
end