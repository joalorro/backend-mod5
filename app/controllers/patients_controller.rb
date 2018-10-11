class PatientsController < ApplicationController
	before_action :set_patient, only: [:show,:update]

	def show 

	end 

	def create 

	end 

	def update 

	end 

	private 

		def patient_params 

		end 

		def set_patient 
			@patient = Patient.find params[:id]
		end 
end
