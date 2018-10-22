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
			render json: @therapist.errors, status: :unprocessable_entity
		end 
	end 

	def update 

	end 

	def get_patients
		@therapist = Therapist.find params[:id]
		@patients = @therapist.patients 
		render json: @patients 
	end 

	def get_exercises 
		@exercises = Exercise.all.select { |e| e.program.therapist.id == params[:id].to_i }.map { |e| {
			id: e.id,
			patientId: e.program.patient.id,
			name: e.name,
			desc: e.desc,
			videoId: YoutubeID.from(e.url),
			flagged: e.flagged,
			comments: e.comments
		}}
		render json: @exercises, status: 200
	end 

	private 

		def therapist_params 
			params.require(:therapist).permit(:first_name,:last_name,:license,:degree,:certifications,:email,:password)
		end 

		def set_therapist 
			@therapist = Therapist.find params[:id]
		end 
end
