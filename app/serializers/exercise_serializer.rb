class ExerciseSerializer < ActiveModel::Serializer
	attributes :id, :name, :desc, :flagged, :patient, :therapist

	def patient
		patient = self.object.program.patient
		patientHash = {
			first_name: patient.first_name,
			last_name: patient.last_name,
			email: patient.email
		}
		patientHash
	end 

	def therapist 
		therapist = self.object.program.therapist 
		therapistHash = {
			name: therapist.name,
			email: therapist.email,
			license: therapist.license,
			degree: therapist.degree,
			certificaitons: therapist.certifications
		}
		therapistHash
	end 

end
