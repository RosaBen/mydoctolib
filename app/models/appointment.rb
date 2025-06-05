# EXO1
# _________________________________________________________
# class Appointment < ApplicationRecord
#   belongs_to :doctor
#   belongs_to :patient
# end

#-------------------------------------------------------------------
class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :city
end
