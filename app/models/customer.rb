class Customer < ApplicationRecord
  include RailsAdminCharts
  belongs_to :address
  belongs_to :user
  
  has_many :leads
  has_many :buildings

after_update :upload_file
  
  def self.chart_type
    "column"
end

# https://github.com/Jesus/dropbox_api to use dopbox api
def upload_file
  self.leads.all.each do |lead|
    client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
    if lead.attachment_file != nil
      
#  _#{File.extname(lead.original_file_name)}
      client.upload("/#{lead.businessName}/#{File.basename(lead.original_file_name)}", lead.attachment_file) 

      lead.attachment_file = nil
      lead.original_file_name = nil
      lead.attachment.purge

      lead.save!

    end
  end
end
end
