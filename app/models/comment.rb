class Comment < ApplicationRecord
	belongs_to :exercise
	belongs_to :commenter, polymorphic: true
end
