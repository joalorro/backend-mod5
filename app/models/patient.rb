class Patient < ApplicationRecord
	has_many :programs
	has_many :therapists, through: :programs
end
