class CommentSerializer < ActiveModel::Serializer
	attributes :id, :content, :exercise_id, :commenter_name, :commenter_id

	def commenter_name
		object.commenter.first_name
	end 
end
