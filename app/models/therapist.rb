class Therapist < ApplicationRecord
	has_many :programs
	has_many :patients, through: :programs
end
