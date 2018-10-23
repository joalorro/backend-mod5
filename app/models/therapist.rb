class Therapist < ApplicationRecord
	has_many :programs
	has_many :patients, through: :programs
	has_many :comments, as: :commenter

	validates :first_name, presence: true 
	validates :last_name, presence: true 

	validates :email, presence: true
	validates :email, uniqueness: true 
	validates :email, confirmation: true 

	validates :password, presence: true
	validates :password, confirmation: true 

	validates :degree, presence: true 
	validates :license, presence: true 
	validates :license, uniqueness: true 

	has_secure_password
end
