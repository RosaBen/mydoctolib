class Specialty < ApplicationRecord
  has_many :doctor_specialties
  has_many :doctors, through: :doctor_specialties
  validates :name, uniqueness: true
end
