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

	private 

		def therapist_params 
			params.require(:therapist).permit(:first_name,:last_name,:license,:degree,:certifications,:email,:password)
		end 

		def set_therapist 
			@therapist = Therapist.find params[:id]
		end 
end
