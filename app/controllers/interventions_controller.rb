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
		@intervention.get_intervention_battery
	elsif params['intervention']['elevator_id'] == ""
		@intervention.get_intervention_column
	else 
		@intervention.get_intervention_elevator
	end

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
