class TherapistsController < ApplicationController
	before_action :set_therapist, only: [:show,:update]

	def show 
		render json: @therapist, status: 200
	end 

	def create 

	end 

	def update 

	end 

	private 

		def therapist_params 
			
		end 

		def set_therapist 
			@therapist = Therapist.find params[:id]
		end 
end
