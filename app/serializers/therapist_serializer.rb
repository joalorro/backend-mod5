class TherapistSerializer < ActiveModel::Serializer
		attributes :id, :name, :email, :password, :license, :certifications, :identifier, :degree
end
