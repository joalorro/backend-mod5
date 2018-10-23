class TherapistsController < ApplicationController
	before_action :set_therapist, only: [:show,:update]

	def show 
		render json: @therapist, status: 200
	end 

	def create 
		@therapist = Therapist.new therapist_params
		if @therapist.save 
			token = JWT.encode({"therapist_id" => @therapist.id}, "071618")
			render({json: {
				therapist: {
					id: @therapist.id,
					first_name: @therapist.first_name,
					last_name: @therapist.last_name,
					token: token,
					email: @therapist.email
				}
			}, status: :created})
		else 
			render({json: {errors: @therapist.errors.full_messages}, status: :unprocessable_entity})
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
			params.require(:therapist).permit(:first_name,:last_name,:license,:degree,:certifications,:email, :email_confirmation, :password, :password_confirmation)
		end 

		def set_therapist 
			@therapist = Therapist.find params[:id]
		end 
end
