class CommentsController < ApplicationController
	before_action :set_comment, only: [:show,:update]


	def show 

	end 

	def create 

	end 

	def update 

	end 

	def destroy

	end 

	private 

		def set_comment 
			@comment = Comment.find params[:id]
		end 

		def comment_params 

		end 
end
