class DoctorSpecialty < ApplicationRecord
  belongs_to :doctor
  belongs_to :specialty

  validates :doctor, uniqueness: { scope: :specialty, message: "has already this specialty" }
end
