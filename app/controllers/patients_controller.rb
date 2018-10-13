class PatientsController < ApplicationController
	before_action :set_patient, only: [:show,:update]

	def index 
		@patients = Patient.all 
		render json: @patients, status: 200
	end 

	def show 
		render json: @patient, status: 200
	end 

	def create 
		@patient = Patient.new patient_params
		if @patient.save 
			render json: @patient, status: 200
		else 
			byebug
		end 
		# respond_to do |format|
		# 	if @patient.save
		# 		format.html { redirect_to @patient, notice: 'patient was successfully created.' }
		# 		format.json { render :show, status: :created, location: @patient }
		# 	else
		# 		format.html { render :new }
		# 		format.json { render json: @patient.errors, status: :unprocessable_entity }
		# 	end
		# end 
	end 

	def update 

	end 

	private 

		def patient_params 
			params.require(:patient).permit(:first_name,:last_name,:email,:password)
		end 

		def set_patient 
			@patient = Patient.find params[:id]
		end 
end
