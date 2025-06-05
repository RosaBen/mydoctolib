# EXO1
# _________________________________________________________
# class Doctor < ApplicationRecord
#   has_many :appointments
#   has_many :patients, through: :appointments
# end

#-------------------------------------------------------------------
class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city
  has_many :doctor_specialties
  has_many :specialties, through: :doctor_specialties
end
