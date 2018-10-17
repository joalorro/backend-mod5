class PatientSerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :email, :therapists

	# def exercises
	# 	object.programs.map do |program|
	# 		program.exercises
	# 	end.flatten
	# end

	def therapists 
		self.object.therapists
	end 
end
