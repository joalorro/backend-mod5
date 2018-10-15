class TherapistsController < ApplicationController
	before_action :set_therapist, only: [:show,:update]

	def show 
		render json: @therapist, status: 200
	end 

	def create 
		@therapist = Therapist.new therapist_params
		if @therapist.save 
			@therapist.identifier = @therapist.id
			render json: @therapist, status: 200
		else 
			byebug
		end 
	end 

	def update 

	end 

	def show_patients
		@therapist = Therapist.find params[:id]
		patients_array = @therapist.patients.map {|p| {
			id: p.id,
			first_name: p.first_name,
			last_name: p.last_name,
			email: p.email
		}}
		
		render json: patients_array.to_json
	end 

	private 

		def therapist_params 
			params.require(:therapist).permit(:first_name,:last_name,:license,:degree,:certifications,:email,:password)
		end 

		def set_therapist 
			@therapist = Therapist.find params[:id]
		end 
end
