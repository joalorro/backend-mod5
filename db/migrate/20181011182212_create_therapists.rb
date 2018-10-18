class CreateTherapists < ActiveRecord::Migration[5.2]
	def change
		create_table :therapists do |t|
			t.string :first_name
			t.string :last_name
			t.string :email
			t.string :password_digest
			t.string :license
			t.string :degree
			t.string :certifications
			t.string :identifier

			t.timestamps
		end
	end
end
