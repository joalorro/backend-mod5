class ExercisesController < ApplicationController
	before_action :set_exercise, only: [:show,:update]

	def index 
		@exercises = Exercise.all
		
		render json: @exercises, status: 200
	end 

	def show 
		render json: @exercise, status: 200
	end 

	def create 
		@exercise = Exercise.new name: exercise_params[:name], desc: exercise_params[:desc], url: exercise_params[:url]
		@program = Program.find_by patient_id: exercise_params[:patient_id], therapist_id: exercise_params[:therapist_id]
		@exercise.program = @program
		if @exercise.save 
			render json: @exercise, status: 200
		else 
			render json: @exercise.errors
		end 
	end 

	def update 

	end 

	def destroy 

	end 

	def toggle_flag 
		@exercise = Exercise.find params[:id]
		if @exercise.update flagged: !@exercise.flagged
			render json: true 
		else 
			render json: false 
		end 
	end 

	# def get_comments 
	# 	@exercise = Exercise.find params[:id]

	# 	if @exercise
	# 		render json: @exercise.comments, status: 200
	# 	else 
	# 		render json: @exercise.errors, status: 422
	# 	end 
	# end 

	private 

		def exercise_params 
			params.require(:exercise).permit(:name,:desc,:url, :patient_id, :therapist_id)
		end 

		def set_exercise 
			@exercise = Exercise.find params[:id]
		end 
end
