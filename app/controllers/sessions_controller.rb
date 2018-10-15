class SessionsController < ApplicationController

	def create 
		model = params[:model]
		class_name = model.titlecase.constantize
		@session_user = class_name.find_by email: params[:email]
		if @session_user == @session_user.authenticate(params[:password])
			# session_hash = {
			# 	valid: true,
			# 	first_name: @session_user.first_name,
			# 	last_mame: @session_user.last_name,
			# 	email: @session_user.email,
			# 	model: model.downcase
			# }	
			
			render status: 200, json: @session_user
		else
			byebug
			# render {json: @session_user.errors, status: 422}
		end 
	end 
end
