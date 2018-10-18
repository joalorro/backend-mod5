class CommentsController < ApplicationController
	before_action :set_comment, only: [:show,:update]


	def show 

	end 

	def create 
		@comment = Comment.new comment_params 
		if @comment.save 
			render json: @comment,status: 200
		else 
			render json: @comment.errors 
		end 
	end 

	def get_comments
		@comments = Comment.all.select { |c| params[:exercise_ids].include?(c.exercise_id) }
		render json: @comments, status: 200
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
			params.require(:comment).permit(:content,:exercise_id)
		end 
end
