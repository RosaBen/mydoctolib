# EXO1
# _________________________________________________________
# class Patient < ApplicationRecord
#   has_many :appointments
#   has_many :doctors, through: :appointments
# end
#-------------------------------------------------------------------

class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  belongs_to :city
end
