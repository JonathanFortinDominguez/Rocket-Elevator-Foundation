class LeadsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

    before_action :set_quote, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token
    
    def index
      @leads = Lead.new
    end
    
  
    def new
  
      @leads = Lead.new
    
    end
  
  
    def create 
      
      fullname = params['fullnameContact']
      businessName = params['businessNameContact']
      email = params['emailContact']
      phone = params['phoneContact']
      projectName = params['projectNameContact']
      desc = params['projectDescContact']
      department = params['department']
      message = params['messageContact']
      attach = params['attachment']
      @leads = Lead.new

      @leads.fullname = fullname
      @leads.businessName = businessName
      @leads.email = email
      @leads.phoneNumber = phone
      @leads.projectName = projectName
      @leads.projectDescription = desc
      @leads.departement = department
      @leads.message = message
      @leads.attachment_file = attach
     
      @leads.follow_up_date = Time.current


      # add file ext to upload file in dropbox
      if @leads.attachment_file != nil
        file_name = @leads.attachment_file.original_filename
        @leads.attachment_file = @leads.attachment_file.read
        @leads.original_file_name = file_name
      end


      @leads.attachment.attach(params[:attachment])
      @leads.save!

      

      UserNotifierMailer.send_signup_email(@leads).deliver
      @leads.contact

      redirect_to root_path
  
  
    end
  
    def index 
      @leads = Lead.all
    end 
  
    def show
    end
  
    def edit
    end
  


end
