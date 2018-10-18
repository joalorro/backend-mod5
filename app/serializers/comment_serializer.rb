class CommentSerializer < ActiveModel::Serializer
	attributes :id, :content, :exercise_id,

	def commenter_name
		object.commenter.first_name
	end 
end
