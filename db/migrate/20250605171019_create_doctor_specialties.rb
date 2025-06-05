class CreateDoctorSpecialties < ActiveRecord::Migration[8.0]
  def change
    create_table :doctor_specialties do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
    add_index :doctor_specialties, [ :doctor_id, :specialty_id ], unique: true, name: 'index_doctor_specialties_on_doctor_and_specialty'
  end
end
