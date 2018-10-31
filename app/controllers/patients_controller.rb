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
		@patient = Patient.new({
			first_name: patient_params[:first_name],
			last_name: patient_params[:last_name],
			email: patient_params[:email],
			password: patient_params[:password],
			email_confirmation: patient_params[:email_confirmation],
			password_confirmation: patient_params[:password_confirmation]
		})
		@therapist = validate_therapist(patient_params[:identifier].to_i)

		if @therapist
			@patient.save 
			generate_program
			patient_obj = generate_patient_obj
			render({json: {patient: patient_obj }, status: :created})
		else 
			@patient.errors.add(:therapists,:must_exist, message: 'identifier must be valid')
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

		def validate_therapist identifier
			Therapist.find_by(id: identifier)
		end 

		def generate_program
			@program = Program.create(patient_id: @patient.id, therapist_id: @therapist.id)
		end 

		def generate_patient_obj
			token = JWT.encode({"patient_id" => @patient.id}, "071618")
			{
				id: @patient.id,
				first_name: @patient.first_name,
				last_name: @patient.last_name,
				token: token,
				email: @patient.email
			}
		end 
end
