# EXO1
# _________________________________________________________
# class CreatePatients < ActiveRecord::Migration[8.0]
#   def change
#     create_table :patients do |t|
#       t.string :first_name
#       t.string :last_name
#       t.timestamps
#     end
#   end
# end

#-------------------------------------------------------------------
class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
