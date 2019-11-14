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

	interventioninfo = params['intervention']
	
	authorid = params['author_select']
	customerid = interventioninfo['customer_id']
	buildingid = interventioninfo['building_id']
	batteryid = interventioninfo['battery_id']
	columnid = interventioninfo['column_id']
	elevatorid = interventioninfo['elevator_id']
	employeeid = interventioninfo['employee_id']
    resultinfo = params['result_intervention']
    reportinfo = params['report_intervention']
    statusinfo = params['status_intervention']


	@intervention = Intervention.new

	@intervention.author_id = authorid
	@intervention.customer_id = customerid
	@intervention.building_id = buildingid
	@intervention.battery_id = batteryid if columnid == ""
	@intervention.column_id = columnid if elevatorid == ""
	@intervention.elevator_id = elevatorid
	@intervention.employee_id = employeeid
	@intervention.report = reportinfo

    @intervention.save!

		redirect_to root_path

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
