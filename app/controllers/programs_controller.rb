class ProgramsController < ApplicationController
	before_action :set_program, only: [:show,:update]

	def show 
		render json: @program
	end 

	def create 

	end 

	def update 

	end 

	def destroy 

	end 

	private 

		def set_program
			@program = Program.find params[:id]
		end 

		def program_params 

		end 
end
