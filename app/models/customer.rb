class Customer < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :interventions, dependent: :restrict_with_exception
  has_many :leads
  has_many :buildings

after_update :upload_file
  


# https://github.com/Jesus/dropbox_api to use dopbox api
def upload_file
  self.leads.all.each do |lead|
    client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
    if lead.attachment_file != nil
      
#  _#{File.extname(lead.original_file_name)}
      client.upload("/#{lead.customer.business_name}/#{File.basename(lead.original_file_name)}", lead.attachment_file) 

      lead.attachment_file = nil
      lead.original_file_name = nil
      lead.attachment.purge

      lead.save!

    end
  end
end
end

def customer_info
  "#{id}"
end
