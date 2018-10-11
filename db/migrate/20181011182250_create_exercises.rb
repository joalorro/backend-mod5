class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :program_id
      t.string :name
      t.text :desc
	  t.string :url
	  t.boolean :flagged

      t.timestamps
    end
  end
end
