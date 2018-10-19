class SessionsController < ApplicationController

	def login 
		model = params[:model] 
		class_name = model.titlecase.constantize 
		@session_user = class_name.find_by email: params[:email]
		if (@session_user && @session_user.authenticate(params[:password]))
			token = JWT.encode({"#{model}_id" => @session_user.id}, "071618")
			render json: {
				"#{model}" => {
					id: @session_user.id,
					first_name: @session_user.first_name,
					last_name: @session_user.last_name,
					token: token,
					email: @session_user.email
				}
			}, status: :authorized 
		else 
			render json: {error: 'Invalid Username or Password', status: :unauthorized}
		end 
	end 

	def persist 
		token = request.headers["Authorization"]
		begin
			payload = JWT.decode(token, '071618', true)
		rescue JWT::DecodeError
			nil
		end

		if payload 
			model = payload[0].keys[0].split('_')[0]
			class_name = model.titlecase.constantize
			@session_user = class_name.find payload.first.values.first
			render json: {
				"#{model}" => {
					id: @session_user.id,
					first_name: @session_user.first_name,
					last_name: @session_user.last_name,
					email: @session_user.email
				}
			}, status: 200
		else 
			render json: {
				error: "Invalid Token"
			}
		end 

	end 
end
