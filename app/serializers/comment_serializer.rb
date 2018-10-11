class CommentSerializer < ActiveModel::Serializer
	attributes :id, :content, :exercise_id
end
