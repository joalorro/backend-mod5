class CreateComments < ActiveRecord::Migration[5.2]
	def change
		create_table :comments do |t|
			t.integer :exercise_id
			t.string :content
			t.references :commenter, polymorphic: true, index: true

			t.timestamps
		end
	end
end
