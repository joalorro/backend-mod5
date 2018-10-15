class Patient < ApplicationRecord
	has_many :programs
	has_many :therapists, through: :programs

	validates :email, presence: true
	validates :email, uniqueness: true 

	has_secure_password
end
