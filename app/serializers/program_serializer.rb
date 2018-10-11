class ProgramSerializer < ActiveModel::Serializer
	belongs_to :patient
	belongs_to :therapist
	attributes :id
end
