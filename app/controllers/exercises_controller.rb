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
		@exercise = Exercise.new exercise_params
		
		if @exercise.save 
			render json: @exercise, status: 200
		end 
	end 

	def update 

	end 

	def destroy 

	end 

	private 

		def exercise_params 
			params.require[:exercise].permit[:name,:desc,:program_id,:flagged]
		end 

		def set_exercise 
			@exercise = Exercise.find params[:id]
		end 
end
