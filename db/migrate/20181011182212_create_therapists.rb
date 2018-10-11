class CreateTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :license
      t.string :certifications
      t.string :identifier

      t.timestamps
    end
  end
end
