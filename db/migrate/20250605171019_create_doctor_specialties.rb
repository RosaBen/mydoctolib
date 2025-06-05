class CreateDoctorSpecialties < ActiveRecord::Migration[8.0]
  def change
    create_table :doctor_specialties do |t|
      t.references :doctor, index: true
      t.references :specialty, index: true

      t.timestamps
    end
    add_index :doctor_specialties, [ :doctor_id, :specialty_id ], unique: true
  end
end
