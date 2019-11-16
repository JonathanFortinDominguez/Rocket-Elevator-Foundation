class InterventionsController < ApplicationController
	skip_before_action :verify_authenticity_token

	# GET /interventions
	# GET /interventions.json
	def index
		@interventions = Intervention.all
	end

	# GET /interventions/1
	# GET /interventions/1.json
	def show
		@user = current_user
		redirect_to root_path, warning: "You are not authorized" unless @user.admin?
	end
	# GET /interventions/new
	def new
		@intervention = Intervention.new
	end

	# GET /interventions/1/edit
	def edit
	end

	# POST /interventions
	# POST /interventions.json
  def create
	@user = current_user
	redirect_to root_path, warning: "You are not authorized" unless @user.admin?

	@intervention = Intervention.new

	@intervention.author_id = params['author_select']
	@intervention.customer_id = params['intervention']['customer_id']
	@intervention.building_id = params['intervention']['building_id']
	@intervention.battery_id = params['intervention']['battery_id'] if params['intervention']['column_id'] == ""
	@intervention.column_id = params['intervention']['column_id'] if params['intervention']['elevator_id'] == ""
	@intervention.elevator_id = params['intervention']['elevator_id']
	@intervention.employee_id = params['intervention']['employee_id']
	@intervention.report = params['report_intervention']

	@intervention.save!
	
    if params['intervention']['column_id'] == ""
		get_intervention_battery(@intervention)
	elsif params['intervention']['elevator_id'] == ""
		get_intervention_column(@intervention)
	else 
		get_intervention_elevator(@intervention)
	end

		redirect_to root_path

	end

	def get_intervention_battery(intervention)

		author_name = intervention.author.name
		business_name = intervention.customer.business_name
		building_nb = intervention.building.id
		admin_fullname = intervention.building.fullName_building_administrator
		address_number = intervention.building.address.street_number
		address_city = intervention.building.address.city
		battery_nb = intervention.battery.id
		employee_name = intervention.employee.name
		report_info = intervention.report

	zendesk = Zendesk.new

	zendesk.get_an_intervention_battery(
		author_name, 
		business_name, 
		building_nb, 
		admin_fullname,
		address_number, 
		address_city, 
		battery_nb, 
		employee_name, 
		report_info) 
end 

def get_intervention_column(intervention)
	
	author_name = intervention.author.name
	business_name = intervention.customer.business_name
	building_nb = intervention.building.id
	admin_fullname = intervention.building.fullName_building_administrator
	address_number = intervention.building.address.street_number
	address_city = intervention.building.address.city
	column_nb = intervention.column.id
	employee_name = intervention.employee.name
	report_info = intervention.report

	zendesk = Zendesk.new

	zendesk.get_an_intervention_column(
		author_name, 
		business_name, 
		building_nb, 
		admin_fullname,
		address_number, 
		address_city, 
		column_nb, 
		employee_name, 
		report_info) 
end 

def get_intervention_elevator(intervention)
	
	author_name = intervention.author.name
	business_name = intervention.customer.business_name
	building_nb = intervention.building.id
	admin_fullname = intervention.building.fullName_building_administrator
	address_number = intervention.building.address.street_number
	address_city = intervention.building.address.city
	elevator_nb = intervention.elevator.id
	employee_name = intervention.employee.name
	report_info = intervention.report

	zendesk = Zendesk.new

	zendesk.get_an_intervention_elevator(
		author_name, 
		business_name, 
		building_nb, 
		admin_fullname,
		address_number, 
		address_city, 
		elevator_nb, 
		employee_name, 
		report_info) 
end





	# PATCH/PUT /interventions/1
	# PATCH/PUT /interventions/1.json
	def update
		respond_to do |format|
			if @intervention.update(intervention_params)
				format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
				format.json { render :show, status: :ok, location: @intervention }
			else
				format.html { render :edit }
				format.json { render json: @intervention.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /interventions/1
	# DELETE /interventions/1.json
	def destroy
		@intervention.destroy
		respond_to do |format|
			format.html { redirect_to interventions_url, notice: 'Intervention was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_intervention
			@intervention = Intervention.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def intervention_params
			params.fetch(:intervention, {})
		end
end
