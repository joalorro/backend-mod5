class TherapistSerializer < ActiveModel::Serializer
		attributes :id, :first_name, :last_name, :email, :license, :certifications, :identifier, :degree, :patients



		# has_many :patients
end
