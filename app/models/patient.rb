class Patient < ApplicationRecord
	has_many :programs
	has_many :therapists, through: :programs
	has_many :comments, as: :commenter

	validates :email, presence: true
	validates :email, uniqueness: true
	validates :email, confirmation: true

	validates :password, presence: true
	validates :password, confirmation: true

	validates :first_name, presence: true
	validates :last_name, presence: true

	has_secure_password

end
