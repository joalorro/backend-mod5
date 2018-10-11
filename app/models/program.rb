class Program < ApplicationRecord
	belongs_to :therapist
	belongs_to :patient
	has_many :exercises
end
