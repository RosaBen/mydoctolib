# EXO1
# # _________________________________________________________
# class CreateAppointments < ActiveRecord::Migration[8.0]
#   def change
#     create_table :appointments do |t|
#       t.belongs_to :doctor, index: true
#       t.belongs_to :patient, index: true
#       t.datetime :date
#       t.timestamps
#     end
#   end
# end
#-------------------------------------------------------------------

class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :patient, index: true
      t.belongs_to :city, index: true
      t.datetime :date
      t.timestamps
    end
  end
end
