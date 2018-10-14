class TherapistSerializer < ActiveModel::Serializer
		attributes :id, :first_name, :last_name, :email, :password, :license, :certifications, :identifier, :degree
end
