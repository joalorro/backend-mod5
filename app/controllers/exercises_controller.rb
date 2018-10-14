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

	end 

	def update 

	end 

	def destroy 

	end 

	private 

		def exercise_params 

		end 

		def set_exercise 
			@exercise = Exercise.find params[:id]
		end 
end
