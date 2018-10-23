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
		@patient = Patient.new(first_name: patient_params[:first_name], last_name: patient_params[:last_name], email: patient_params[:email], password: patient_params[:password], email_confirmation: patient_params[:email_confirmation], password_confirmation: patient_params[:password_confirmation])
		
		if Therapist.find_by(id: patient_params[:identifier])
			@therapist = Therapist.find_by(id: patient_params[:identifier].to_i) 
			@patient.therapists << @therapist
		end 

		if @patient.save 
			token = JWT.encode({"patient_id" => @patient.id}, "071618")
			render({json: {
				patient: {
					id: @patient.id,
					first_name: @patient.first_name,
					last_name: @patient.last_name,
					token: token,
					email: @patient.email
				}
			}, status: :created})
		else 
			byebug
			render ({json: {errors: @patient.errors.full_messages}, status: :unprocessable_entity})
		end
	end 

	def update 

	end 

	def get_exercises 
		@exercises = Exercise.all.select {|e| e.program.patient.id == params[:id].to_i}.map{ |e| {
			id: e.id,
			name: e.name,
			desc: e.desc,
			videoId: YoutubeID.from(e.url),
			flagged: e.flagged,
			comments: e.comments
		}}
		render json: @exercises, status: 200
	end 

	private 

		def patient_params 
			params.require(:patient).permit(:first_name,:last_name,:email, :email_confirmation, :password, :password_confirmation, :identifier)
		end 

		def set_patient 
			@patient = Patient.find params[:id]
		end 
end
