class Therapist < ApplicationRecord
	has_many :programs
	has_many :patients, through: :programs
	has_many :comments, as: :commenter

	validates :email, presence: true
	validates :email, uniqueness: true 

	has_secure_password
end
