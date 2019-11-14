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
		authorid = params['author_select']
		customerid = params['customer_select']
		buildingid = params['building_select']
		batteryid = params['battery_select']
		columnid = params['column_select']
		elevatorid = params['elevator_select']['elevator_select']
		employeeid = params['employee_select']['employee_select']
    resultinfo = params['result_intervention']
    reportinfo = params['report_intervention']
    statusinfo = params['status_intervention']


		@intervention = Intervention.new

		@intervention.author = authorid
		@intervention.customer = customerid
		@intervention.building = buildingid
		@intervention.battery = batteryid
		@intervention.column_id = columnid
		@intervention.elevator_id = elevatorid 
		@intervention.employee_id = employeeid
		@intervention.result = resultinfo
		@intervention.report = reportinfo
		@intervention.status = statusinfo

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
