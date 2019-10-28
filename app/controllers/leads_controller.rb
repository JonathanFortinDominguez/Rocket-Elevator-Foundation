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

      @leads = Lead.new

      @leads.fullname = fullname
      @leads.businessName = businessName
      @leads.email = email
      @leads.phoneNumber = phone
      @leads.projectName = projectName
      @leads.projectDescription = desc
      @leads.departement = department
      @leads.message = message
      @leads.attachment.attach(params[:attachment])
      @leads.follow_up_date = Time.current

      @leads.save!

      # UserNotifierMailer.send_signup_email(@leads).deliver
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
