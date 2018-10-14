class ExerciseSerializer < ActiveModel::Serializer
	attributes :id, :name, :desc, :flagged, :patient, :therapist

	def patient
		patient = self.object.program.patient
		patientHash = {
			id: patient.id,
			first_name: patient.first_name,
			last_name: patient.last_name,
			email: patient.email
		}
		patientHash
	end 

	def therapist 
		therapist = self.object.program.therapist 
		therapistHash = {
			id: therapist.id,
			first_name: therapist.first_name,
			last_name: therapist.last_name,
			email: therapist.email,
			license: therapist.license,
			degree: therapist.degree,
			certificaitons: therapist.certifications
		}
		therapistHash
	end 

end
