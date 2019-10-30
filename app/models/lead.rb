require './lib/api/zendesk.rb'

class Lead < ApplicationRecord
    include RailsAdminCharts
    has_one_attached :attachment
    belongs_to :customer, optional: true
    


    def self.chart_type
        "column"
    end

    def upload_file
        client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
        puts "-------------------------------------------------"

        
        client.upload("/#{self.fullname}/#{File.basename(self.businessName)}_#{File.extname(self.original_file_name)}", self.attachment_file) 


      end

    def contact
        zendesk = Zendesk.new
        zendesk.contact_us(self.fullname, self.businessName, self.email, self.phoneNumber, self.departement, 
            self.projectName, self.projectDescription, self.message)
    end    

end
